import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ImageCacheHelper {
  static final Dio _dio = Dio();

  static Future<File> getCachedImage(String url) async {
    final dir = await getTemporaryDirectory();

    final fileName = Uri.parse(url).pathSegments.last;
    final filePath = '${dir.path}/$fileName';

    final file = File(filePath);

    if (await file.exists()) {
      return file;
    }

    final response = await _dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    await file.writeAsBytes(response.data);

    return file;
  }
}