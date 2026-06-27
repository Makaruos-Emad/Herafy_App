import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/profile/data/profile_api_service.dart';
import 'package:herafy/features/profile/helper/save_id_client_in_storge.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final api = ProfileApiService();

  void getProfile() async {
    emit(ProfileLoading());

    try {
      final response = await api.getClientProfile();
      await saveIdClient(response.data['userId'].toString());
      emit(ProfileSuccess(response.data));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  // ✏️ UPDATE PROFILE

  Future<void> updateProfile({
    required String name,
    required String governorate,
    required String city,
    required File image,
  }) async {
    emit(ProfileLoading());

    try {
      await api.updateProfile(
        name: name,
        governorate: governorate,
        city: city,
        image: image,
      );

      getProfile(); // 🔥 refresh بعد التعديل
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
