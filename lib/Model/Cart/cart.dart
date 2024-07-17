import 'package:utmccos/Model/Tools/JsonParse/product_parse.dart';
import 'package:hive_flutter/adapters.dart';

//provides functionalities for managing a user's shopping cart. 
//It leverages Hive for local data storage, allowing users to add, remove, view, 
//and calculate the total price of their selected products
class CartFunctions {
  final String boxName = "CartBox";
  Future<void> openCartBox() async {
    await Hive.openBox<ProductEntity>(boxName);
  }

//ProductEntity object representing the product to be added and adds it 
//to the "CartBox" using Hive's add function
  Future<bool> addToCart({required ProductEntity productEntity}) async {
    final box = Hive.box<ProductEntity>(boxName);
    await box.add(productEntity);
    return true;
  }

//retrieves a list of all ProductEntity objects currently stored in the "CartBox,"
  Future<List<ProductEntity>> getProductFromHive() async {
    final box = Hive.box<ProductEntity>(boxName);
    List<ProductEntity> productList = [];
    productList = box.values.toList();

    return productList;
  }
//delete from list
  Future<bool> deleteProduct({required int index}) async {
    final box = Hive.box<ProductEntity>(boxName);
    await box.deleteAt(index);
    return true;
  }
//calculate total price in cart
  String calculateTotalPrice({required List<ProductEntity> productList}) {
    double equ = 0;
    String result;
    for (var element in productList) {
      equ = equ + double.parse(element.price);
    }
    result = equ.toString();
    return result;
  }

  Future<bool> clearCartBox() async {
    final box = Hive.box<ProductEntity>(boxName);
    await box.clear();
    return true;
  }
}
