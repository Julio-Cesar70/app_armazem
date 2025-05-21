import 'package:armazen_do_sitio/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ProductService {
  static Future<List<Product>> fetchProducts() async { 
    final response = await http.get(Uri.parse("http://40.160.16.244:8779/product"))
    .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) { 
      List<dynamic> jsonResponse = json.decode(response.body);
      print(json.decode(response.body));
      return jsonResponse.map((product) => Product.fromJSON(product)).toList();
    } else { 
      throw Exception("Failed to load products");
    }
  }
}