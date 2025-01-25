import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServiceHttp {
  final String baseUrl;

  ApiServiceHttp(this.baseUrl);

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
