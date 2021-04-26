import 'package:latlng/latlng.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';


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
}
