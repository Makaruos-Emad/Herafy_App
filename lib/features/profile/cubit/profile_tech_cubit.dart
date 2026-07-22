import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/profile/cubit/profile_tech_state.dart';
import 'package:herafy/features/profile/data/profile_api_service.dart';
import 'package:herafy/features/profile/helper/save_id_technician_in_storge.dart';

class ProfileTechCubit extends Cubit<ProfileTechState> {
  ProfileTechCubit() : super(ProfileTechInitial());

  final api = ProfileApiService();

  void getProfile() async {
    emit(ProfileTechLoading());

    try {
      final response = await api.getTechnicianProfile();

      saveIdTechnician(response.data['userId']);
      
      emit(ProfileTechSuccess(response.data));
    } catch (e) {
      emit(ProfileTechError(e.toString()));
    }
  }

  // ✏️ UPDATE PROFILE

  Future<void> updatTechProfile({
    required String name,
    required String governorate,
    required String city,
    required File image,
    required String bio,
    required int experienceYears,
    required double inspectedPrice,
  }) async {
    emit(ProfileTechLoading());

    try {
      await api.updateTechnicalProfile(
        fullName: name,
        governorate: governorate,
        city: city,
        image: image,
        bio: bio,
        experienceYears: experienceYears,
        inspectedPrice: inspectedPrice,
      );

      getProfile(); // 🔥 refresh بعد التعديل
    } catch (e) {
      emit(ProfileTechError(e.toString()));
    }
  }

  Future<void> updateAvailability(bool isAvailable) async {
    await api.updateAvailability(isAvailable);
  }
}
