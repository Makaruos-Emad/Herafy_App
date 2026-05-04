import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/core/api/api_service.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final api = ApiService();

  void getProfile() async {
    emit(ProfileLoading());

    try {
      final response = await api.getProfile("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImI0M2NkOWEwLTJjMjktNDY2Zi1iZWY0LTVmMDNlMzk4NTVlMiIsIlRva2VuSWQiOiI2ZGM3MmFmMy1lNTY0LTQ4NmUtYWNiNC0yMmMyNTk4ZjNlZmQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6IisyMDEyNzc5ODMyOTIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDbGllbnQiLCJleHAiOjE3Nzk3NjcxNzUsImlzcyI6Imh0dHBzOi8vaGVyYWZ5LnJ1bmFzcC5uZXQvIiwiYXVkIjoiaHR0cHM6Ly9oZXJhZnkucnVuYXNwLm5ldC8ifQ._FXNXPzMJbUfvj5vQjDraGPaXSvzR5X8y-mFIvRL7p4");

      emit(ProfileSuccess(response.data));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}