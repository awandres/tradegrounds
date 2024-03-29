// import 'package:latlng/latlng.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:storegrounds/delivery_dashboard/widgets/status.dart';

import '../models/product.dart';
import '../models/product_center.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';

class ProductProvider with ChangeNotifier {
  String status = "Morning Route";
  bool _productListExpanded = false;
  bool _listMode = true;

//Products
  List<Product> _activeProductList = [
    Product(
      name: 'Boots',
      cost: '150.00',
      sku: '15ADU7C126',
      active: true,
      amountInsured: 150,
      amountDelivered: 13,
      deliveryCost: 4.25,
      imageUrl: 'assets/images/boots.jpg',
    ),
    Product(
      name: 'Harlequin Blazer',
      cost: '130.00',
      sku: 'DC2AU7C922',
      active: true,
      amountInsured: 130,
      amountDelivered: 11,
      deliveryCost: 3.25,
      imageUrl: 'assets/images/shirt.jpg',
    ),
    Product(
      name: 'Wolfneck Blazer',
      cost: '150.00',
      sku: '00PDO918223',
      active: true,
      amountInsured: 90,
      amountDelivered: 13,
      deliveryCost: 1.25,
      imageUrl: 'assets/images/blazer.jpg',
    ),
  ];

  List<Product> _inactiveProductList = [
    Product(
      name: 'Adam Driver',
      cost: '100.00',
      sku: '00PDO918223',
      active: false,
      amountInsured: 90,
      amountDelivered: 13,
      deliveryCost: 1.25,
      imageUrl: 'assets/images/blazer.jpg',
    ),
    Product(
      name: 'Craft Bidet',
      cost: '1,000.00',
      sku: '00PDO918223',
      active: false,
      amountInsured: 90,
      amountDelivered: 13,
      deliveryCost: 1.25,
      imageUrl: 'assets/images/sweater.jpg',
    ),
  ];

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

  get products => [_product1, _product2, _product3, _product4, _product5];

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
  List get inactiveProductList => _inactiveProductList;
  List get activeProductList => _activeProductList;
  bool get productListExpanded => _productListExpanded;
  bool get listMode => _listMode;

  void toggleProductListExpanded() {
    _productListExpanded = !_productListExpanded;
    notifyListeners();
  }

  void toggleListMode() {
    _listMode = !_listMode;
    print('toggline listmode listmode is $listMode');
    notifyListeners();
  }
}
