import 'package:flutter/cupertino.dart';
import 'package:onlineshop/model/product.dart';
import '../model/order.dart';

class OrderNotify extends ChangeNotifier {
  List<Order> items = [];

  void addOrder(Order order) {
    final i = items.indexWhere((e) => e.product == order.product);
    if (i > -1) {
      items[i].qty += order.qty;
    } else {
      this.items.add(order);
    }
    notifyListeners();
  }
}
