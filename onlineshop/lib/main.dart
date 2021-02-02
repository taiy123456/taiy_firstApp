import 'package:flutter/material.dart';
import 'package:onlineshop/model/order.dart';
import 'package:onlineshop/model/product.dart';
import 'package:intl/intl.dart';
import 'package:onlineshop/provider/order_notify.dart';
import 'package:onlineshop/screen_order.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OrderNotify(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Product> items = [
    Product(
      image: 'images/iphone.png',
      name: 'iphone Xs 64GB',
      desc: 'iphone Xs...............',
      price: 2800000,
    ),
    Product(
      image: 'images/iphone11.png',
      name: 'iphone 11 250GB',
      desc: 'iphone 11...............',
      price: 4500000,
    ),
    Product(
      image: 'images/iphonexplus.png',
      name: 'iphone Xs plus 125GB',
      desc: 'iphone Xs plus...............',
      price: 3500000,
    ),
    Product(
      image: 'images/iphone11pro.png',
      name: 'iphone11 pro max 125GB',
      desc: 'iphone11 plus...............',
      price: 5200000,
    ),
    Product(
      image: 'images/iphonexr.png',
      name: 'iphone Xr 125GB',
      desc: 'iphone Xr ...............',
      price: 2000000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khai DiD'),
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen_Order(),
                      ),
                    );
                  }),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      context.watch<OrderNotify>().items.length.toString(),
                    ),
                  ),
                ),
                top: 5,
                right: 5,
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: items
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCart(e),
                ))
            .toList(),
      ),
    );
  }
}

class ProductCart extends StatelessWidget {
  Product product;
  ProductCart(this.product);

  final oCcy = new NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          product.image,
          width: 120,
          height: 130,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                product.desc,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton.icon(
                    elevation: 0,
                    onPressed: () {
                      // var o = Order(Product:product,qt);
                      context.read<OrderNotify>().addOrder(Order(
                          product: product, qty: 1, price: product.price));
                    },
                    icon: Icon(Icons.add),
                    label: Text('add'),
                  ),
                  Text(
                    " ${oCcy.format(double.parse(product.price.toString()))} kip",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        // color: Colors.blue,
                        color: Color(0xff0D5CB9)),
                  )
                ],
              )
            ],
          ),
        ))
        // Image.network(
        //   'https://drop.ndtv.com/TECH/product_database/images/913201720152AM_635_iphone_x.jpeg?downsize=*:420&output-quality=80',
        // width: 90,
        // )
      ],
    );
  }
}
