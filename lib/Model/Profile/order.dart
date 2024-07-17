import 'package:utmccos/Model/Tools/Entities/OrderEntity/order_entity.dart';
import 'package:hive/hive.dart';

//manage orders in a Hive box. It can add new orders, retrieve a list of existing orders
class OrderFunctions {
  final String orderBoxName = "Order Box";
  Future<void> openOrderBox() async {
    bool isOpen = Hive.isBoxOpen(orderBoxName);
    if (!isOpen) {
      await Hive.openBox<OrderEntity>(orderBoxName);
    }
  }

  Future<bool> addToOrderBox({required OrderEntity orderEntity}) async {
    await openOrderBox();
    final box = Hive.box<OrderEntity>(orderBoxName);
    await box.add(orderEntity);
    await box.close();
    return true;
  }

  Future<List<OrderEntity>> getOrderList() async {
    await openOrderBox();
    final box = Hive.box<OrderEntity>(orderBoxName);
    final List<OrderEntity> orderList = box.values.toList();
    await box.close();
    return orderList;
  }
}
