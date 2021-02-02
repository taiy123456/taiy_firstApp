import 'package:flutter/material.dart';
import 'package:onlineshop/provider/order_notify.dart';
import 'package:onlineshop/ui/order_card.dart';
import 'package:provider/provider.dart';

class Screen_Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderNotify>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('My Order'),
          actions: [
            Text(
              order.items.length.toString(),
            )
          ],
        ),
        body: ListView(
          children: order.items.map((e) => OrderCard(e)).toList(),
        ));
  }
}
