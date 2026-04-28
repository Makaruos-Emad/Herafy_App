import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herafy/features/auth/cubit/auth_cubit/auth_state.dart';

enum UserType { technician, client }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  UserType? userType;
  String? phone;
  String? otp;

  // اختيار نوع المستخدم
  void selectUserType(UserType type) {
    userType = type;
    emit(AuthEnterPhone());
  }

  // إدخال الرقم
  void submitPhone(String phoneNumber) {
    phone = phoneNumber;
    emit(AuthEnterOtp());
  }

  // إدخال الكود
  void submitOtp(String code) {
    otp = code;
    emit(AuthEnterData());
  }

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