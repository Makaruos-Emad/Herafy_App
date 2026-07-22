export 'package:herafy/features/auth/data/auth_api_service.dart';
export 'package:herafy/features/profile/data/profile_api_service.dart';
export 'package:herafy/features/requests/data/requests_api_service.dart';
export 'package:herafy/features/service_request/data/service_request_api_service.dart';
import 'package:dio/dio.dart';
class ApiService {
  late Dio dio;

  ApiService() {
    dio = Dio(BaseOptions(baseUrl: "https://herafy.runasp.net/api/"));
  }
}
