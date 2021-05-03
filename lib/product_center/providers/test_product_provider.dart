// import 'package:latlng/latlng.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:storegrounds/delivery_dashboard/widgets/status.dart';

// import '../models/product.dart';
// import '../models/product_center.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ProductProvider with ChangeNotifier {
//   String status = "Morning Route";
//   List<Product> _products = [
//     Product(
//       name: 'Wolfneck Blazer',
//       cost: '150.00',
//       sku: '15ADU7C126',
//       active: true,
//       amountInsured: 150,
//       amountDelivered: 13,
//       deliveryCost: 4.25,
//     ),
//     Product(
//       name: 'Harlequin Blazer',
//       cost: '130.00',
//       sku: 'DC2AU7C922',
//       active: true,
//       amountInsured: 130,
//       amountDelivered: 11,
//       deliveryCost: 3.25,
//     ),
//     Product(
//       name: 'Wolfneck Blazer',
//       cost: '150.00',
//       sku: '00PDO918223',
//       active: true,
//       amountInsured: 90,
//       amountDelivered: 13,
//       deliveryCost: 1.25,
//     ),
//   ];

//   ProductCenter productCenter = ProductCenter(
//     activeProducts: 3,
//     inactiveProducts: 5,
//     deliveriesThisWeek: 10,
//     totalDeliveries: 300,
//   );

//   int get activeProducts => productCenter.activeProducts;
//   int get inactiveProducts => productCenter.inactiveProducts;
//   int get deliveriesThisWeek => productCenter.deliveriesThisWeek;
//   int get totalDeliveries => productCenter.totalDeliveries;
//   List get productList => _products;
// }
