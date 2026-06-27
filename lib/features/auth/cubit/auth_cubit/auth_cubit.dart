import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_state.dart';
import 'package:herafy/features/auth/data/auth_api_service.dart';
import 'package:herafy/features/auth/helper/auth_token_storage.dart';
import 'package:herafy/features/auth/helper/save_user_type_in_storge.dart';

enum UserType { technician, client }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  UserType? userType;
  String? phone;
  String? otp;
  final apiService = AuthApiService();
  // اختيار نوع المستخدم
  Future<void> selectUserType(UserType type) async {
    userType = type;
    if (userType == UserType.technician) {
      await saveUserType(0);
    } else {
      await saveUserType(1);
    }
    emit(AuthEnterPhone());
  }

  // إدخال الرقم
  Future<void> submitPhone(String phoneNumber) async {
    phone = phoneNumber;
    emit(AuthLoading());
    try {
      final int userTypeId = await getUserType() ?? 0;

      final response = await apiService.getTokenFormPhoneNumber(
        phoneNumber: phoneNumber,
        userType: userTypeId,
      );
      final token = response.data['token'].toString();
      await saveAuthToken(token);

      if (response.data['isNew']) {
        emit(AuthEnterData(
          token: token,
        ));
      } else {
        emit(AuthToHomePage(
          token: token,
        ));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  // إدخال الكود
  // void submitOtp(String code) {
  //   otp = code;
  //   emit(AuthEnterData());
  // }

  // رجوع
  void goBack() {
    if (state is AuthEnterPhone) {
      emit(AuthInitial());
    } else if (state is AuthEnterOtp) {
      emit(AuthEnterPhone());
    } else if (state is AuthEnterData) {
      emit(AuthEnterOtp());
    }
  }
}
