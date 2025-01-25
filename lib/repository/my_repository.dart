import 'package:api_call/models/my_model.dart';
import 'package:api_call/services/api_services_dio.dart';
import 'package:api_call/services/api_services_http.dart';

class MyRepository {
  final ApiServiceHttp apiServiceHttp;
  final ApiServiceDio apiServiceDio;

  MyRepository({required this.apiServiceHttp, required this.apiServiceDio});

  Future<List<Product>> fetchProductsWithHttp() async {
    final products = await apiServiceHttp.fetchProducts();
    return products.map<Product>((item) => Product.fromJson(item)).toList();
  }

  Future<List<Product>> fetchProductsWithDio() async {
    final products = await apiServiceDio.fetchProducts();
    return products.map<Product>((item) => Product.fromJson(item)).toList();
  }
}
