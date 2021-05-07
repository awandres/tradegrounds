import 'package:latlng/latlng.dart';
import 'package:flutter/foundation.dart';

class Product {
  // final String productUrl;
  final String name;
  final String cost;
  final String sku;
  final bool active;
  final double deliveryCost;
  final int amountInsured;
  final int amountDelivered;
  final String imageUrl;

  Product({
    // @required this.productUrl,
    @required this.name,
    @required this.cost,
    @required this.sku,
    @required this.active,
    @required this.amountInsured,
    @required this.amountDelivered,
    @required this.deliveryCost,
    @required this.imageUrl,
  });
}
