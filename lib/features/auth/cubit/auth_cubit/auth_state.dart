abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthEnterPhone extends AuthState {}

class AuthEnterOtp extends AuthState {}

class AuthEnterData extends AuthState {
  final String token;
  AuthEnterData({required this.token});
}

class AuthError extends AuthState { 
  final String message;
  AuthError(this.message);}

class AuthLoading extends AuthState {}

class AuthToHomePage extends AuthState {
  final String token;
  AuthToHomePage({required this.token});
}