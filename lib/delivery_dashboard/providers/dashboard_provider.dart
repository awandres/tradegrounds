import 'package:latlng/latlng.dart';
import 'package:provider/provider.dart';
import 'package:storegrounds/delivery_dashboard/widgets/status.dart';

import '../models/delivery.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashboardProvider with ChangeNotifier {
  String status = "Morning Route";
  List<Delivery> _deliveries = [
    Delivery(
        items: [Product(), Product()],
        cost: "50",
        pickup: "asdasd",
        dropoff: "asdasdasd",
        window: 1,
        current_location: LatLng(56.000, 60.998)),
    Delivery(
        items: [Product(), Product()],
        cost: "50",
        pickup: "asdasd",
        dropoff: "asdasdasd",
        window: 1,
        current_location: LatLng(56.000, 60.998)),
    Delivery(
        items: [Product(), Product()],
        cost: "50",
        pickup: "asdasd",
        dropoff: "asdasdasd",
        window: 1,
        current_location: LatLng(56.000, 60.998)),
    Delivery(
        items: [Product(), Product()],
        cost: "50",
        pickup: "asdasd",
        dropoff: "asdasdasd",
        window: 1,
        current_location: LatLng(56.000, 60.998)),
  ];

  List<Delivery> get deliveries {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._deliveries];
  }

  int get deliveryCount {
    return _deliveries.length;
  }

  void setStatus(){

  }
}
