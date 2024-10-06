import 'package:technical_project/core/imports_core.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }
}
