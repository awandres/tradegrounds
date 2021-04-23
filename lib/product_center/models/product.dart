import 'package:latlng/latlng.dart';

class Product {
  String name;
  String cost;
  String sku;
  bool active;
  double deliveryCost;
  int amountInsured;
  int amountDelivered;

  Product({
    this.name,
    this.cost,
    this.sku,
    this.active,
    this.amountInsured,
    this.amountDelivered,
    this.deliveryCost,
  }) {}
}
