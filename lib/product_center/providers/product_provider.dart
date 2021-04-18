import 'package:latlng/latlng.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:storegrounds/delivery_dashboard/widgets/status.dart';

import '../models/product.dart';
import '../models/product_center.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  String status = "Morning Route";
  List<Product> _products = [
    Product(name: 'Product A', cost: '25.00'),
    Product(name: 'Product A', cost: '25.00'),
    Product(name: 'Product A', cost: '25.00'),
  ];

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
  List get productList => _products;
}
