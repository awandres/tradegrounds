import '../models/product.dart';
import '../models/product_center.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  String status = "Morning Route";
  bool _productListExpanded = false;

//Products
    final _product1 = Product(
      name: 'Wolfneck Blazer',
      cost: '150.00',
      sku: '15ADU7C126',
      active: true,
      amountInsured: 150,
      amountDelivered: 13,
      deliveryCost: 4.25,
    );

   final _product2 = Product(
      name: 'Harlequin Blazer',
      cost: '130.00',
      sku: 'DC2AU7C922',
      active: true,
      amountInsured: 130,
      amountDelivered: 11,
      deliveryCost: 3.25,
    );

    final _product3 = Product(
      name: 'Wolfneck Blazer',
      cost: '150.00',
      sku: '00PDO918223',
      active: true,
      amountInsured: 90,
      amountDelivered: 13,
      deliveryCost: 1.25,
    );

    final _product4 = Product(
      name: 'Adam Driver',
      cost: '100.00',
      sku: '00PDO918223',
      active: false,
      amountInsured: 90,
      amountDelivered: 13,
      deliveryCost: 1.25,
    );

    final _product5 = Product(
      name: 'Craft Bidet',
      cost: '1,000.00',
      sku: '00PDO918223',
      active: false,
      amountInsured: 90,
      amountDelivered: 13,
      deliveryCost: 1.25,
    );

get products => [_product1,_product2,_product3, _product4, _product5];


    //product dashboard
  ProductCenter productCenter = ProductCenter(
    activeProducts: 3,
    inactiveProducts: 5,
    deliveriesThisWeek: 10,
    totalDeliveries: 300,
  );

  int get activeProducts => productCenter.activeProducts;

  int get inactiveProducts => productCenter.inactiveProducts;

  int get deliveriesThisWeek => productCenter.deliveriesThisWeek;

  int get totalDeliveries => productCenter.totalDeliveries;

  // List get productList => _products;

  bool get productListExpanded => _productListExpanded;

  void toggleProductListExpanded() {
    _productListExpanded = !_productListExpanded;
    notifyListeners();
  }
}
