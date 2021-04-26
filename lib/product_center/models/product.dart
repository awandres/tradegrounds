import 'package:latlng/latlng.dart';
import 'package:flutter/foundation.dart';

class Product {
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
}
