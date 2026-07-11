import 'package:dio/dio.dart';
import 'package:herafy/features/auth/helper/auth_token_storage.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: "https://herafy.runasp.net/api/"));
  }

  late final Dio dio;

  Future<Options> authorizedOptions({Map<String, dynamic>? headers}) async {
    final token = await getAuthToken();
    return Options(
      headers: {
        if (token != null) "Authorization": "Bearer $token",
        ...?headers,
      },
    );
  }
}
