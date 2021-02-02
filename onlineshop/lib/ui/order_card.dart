import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlineshop/model/order.dart';

class OrderCard extends StatelessWidget {
  Order order;

  OrderCard(this.order);

  
  final oCcy = new NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          order.product.image,
          width: 120,
        ),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            order.product.name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(order.product.desc),
          Row(children: [
            Container(
              width: 60,
              child: OutlineButton.icon(
                onPressed: () {},
                icon: Icon(Icons.remove),
                label: Text(''),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                order.qty.toString(),
              ),
            ),
            Container(
              width: 50,
              child: RaisedButton(
                child: Icon(Icons.plus_one),
              ),
            ),
            Text(
              " ${oCcy.format(double.parse((order.qty * order.price).toString()))} kip",
              
            ),
          ])
        ]))
      ],
    );
  }
}
