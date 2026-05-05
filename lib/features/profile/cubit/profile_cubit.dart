import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final api = ApiService();

  void getProfile() async {
    emit(ProfileLoading());

    try {
      final response = await api.getProfile(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEwZDA1MDlkLTU1NmQtNGUyNC04MTQ1LTExMGY0NTgwNzUyMCIsIlRva2VuSWQiOiJlYzU5ZWVjMS0zNTZkLTQ0MTAtYTg1ZS01ZDE3NzkzMDQzMDMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEyNzExMDA0OTQiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDbGllbnQiLCJleHAiOjE3ODA2NDQxNjksImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.K2cbc3lWxvLlOdJ5Bqgtdpi2q90XLvafTdXv-ltAI94",
      );

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
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEwZDA1MDlkLTU1NmQtNGUyNC04MTQ1LTExMGY0NTgwNzUyMCIsIlRva2VuSWQiOiJlYzU5ZWVjMS0zNTZkLTQ0MTAtYTg1ZS01ZDE3NzkzMDQzMDMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEyNzExMDA0OTQiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDbGllbnQiLCJleHAiOjE3ODA2NDQxNjksImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ.K2cbc3lWxvLlOdJ5Bqgtdpi2q90XLvafTdXv-ltAI94",
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
