import 'package:dio/dio.dart';
import 'package:utmccos/Model/Tools/JsonParse/product_parse.dart';

abstract class HomeDataSource {
  Future<List<ProductEntity>> getProducts();
  Future<List<ProductEntity>> getProductsWithKeyWord(
      {required String keyWord});
}
//defines a data source class for fetching product data from a firebase server using the Dio library.
class HomeRemoteDataSource implements HomeDataSource {
  final Dio httpClient;

  HomeRemoteDataSource({required this.httpClient});
  @override
  //for product list
  Future<List<ProductEntity>> getProducts() async {
    final response = await httpClient.get(
        "https://utmccos1-default-rtdb.asia-southeast1.firebasedatabase.app/.json");
    final List<ProductEntity> productList = [];
    for (var product in (response.data) as List) {
      productList.add(ProductEntity.fromJson(product));
    }
    return productList;
  }

  @override
  //for search product
  Future<List<ProductEntity>> getProductsWithKeyWord(
      {required String keyWord}) async {
    final response = await httpClient.get(
        "https://utmccos1-default-rtdb.asia-southeast1.firebasedatabase.app/.json");
    final List<ProductEntity> productList = [];
    final data=(response.data)as List;
    if (data.isNotEmpty) {
      for (var element in data) {
        productList.add(ProductEntity.fromJson(element));
      }
    }
    return productList;
  }
}
