import 'package:dio/dio.dart';

class ApiService {
  late Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://herafy.runasp.net/api/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<Response> getProfile(String token) async {
    return await dio.get(
      "Client/Profile",
      options: Options(
        headers: {
          "Authorization":
              "Bearer $token",
        },
      ),
    );
  }
}
