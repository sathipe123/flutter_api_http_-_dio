import 'package:dio/dio.dart';

class ApiServiceDio {
  final Dio dio;

  ApiServiceDio(String baseUrl)
      : dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: Duration(milliseconds: 5000),
            receiveTimeout: Duration(milliseconds: 3000)));

  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await dio.get('/products');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
