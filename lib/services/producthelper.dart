
import 'package:mvapp/models/productmodel.dart';
import 'package:http/http.dart' as http;

class ProductHelper{
  Future<List<ProductModel>> getProduct() async{
    final response = await http.get(Uri.parse("https://mvs.bslmeiyu.com/api/v1/products/popular"));
    final productList=productsfromJson(response.body);
    return productList;
  }
}