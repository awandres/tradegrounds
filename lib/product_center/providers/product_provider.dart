import 'package:latlng/latlng.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';


<<<<<<< HEAD
class Product with ChangeNotifier{
  String name;
  String cost;
  String sku;
  bool active;
  double deliveryCost;
  int amountInsured;
  int amountDelivered;

  Product ({
    @required this.name,
    @required this.cost,
    @required this.sku,
    @required this.active,
    @required this.amountInsured,
    @required this.amountDelivered,
    @required this.deliveryCost,
  });
=======
class ProductProvider with ChangeNotifier {
  String status = "Morning Route";
  bool _productListExpanded = false;

  List<Product> _activeProductList = [
    Product(
      name: 'Wolfneck Blazer',
      cost: '150.00',
      sku: '15ADU7C126',
      active: true,
      amountInsured: 150,
      amountDelivered: 13,
      deliveryCost: 4.25,
    ),
    Product(
      name: 'Harlequin Blazer',
      cost: '130.00',
      sku: 'DC2AU7C922',
      active: true,
      amountInsured: 130,
      amountDelivered: 11,
      deliveryCost: 3.25,
    ),
    Product(
      name: 'Wolfneck Blazer',
      cost: '150.00',
      sku: '00PDO918223',
      active: true,
      amountInsured: 90,
      amountDelivered: 13,
      deliveryCost: 1.25,
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
    ),
    Product(
      name: 'Craft Bidet',
      cost: '1,000.00',
      sku: '00PDO918223',
      active: false,
      amountInsured: 90,
      amountDelivered: 13,
      deliveryCost: 1.25,
    ),
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
  // List get productList => _products;
  List get inactiveProductList => _inactiveProductList;
  List get activeProductList => _activeProductList;
  bool get productListExpanded => _productListExpanded;

  void toggleProductListExpanded() {
    _productListExpanded = !_productListExpanded;
    notifyListeners();
  }
>>>>>>> 2fc0daaf496d8fba1d267cebb91eacae34e2945e
}
