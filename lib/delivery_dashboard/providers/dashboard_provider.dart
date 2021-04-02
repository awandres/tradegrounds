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
      // courier is a test variable
      // courier is assigned when a courier accepts this delivery
      courier: 'Bob the builda',
      //fullfilled is a test variable
      // fullfilled can only be updated by a courier
      fulfilled: true,
        items: [Product(), Product()],
        cost: "50",
        pickup: "asdasd",
        dropoff: "asdasdasd",
        window: 1,
        current_location: LatLng(56.000, 60.998)),
    Delivery(
      //courier is a test variable
      // courier is assigned when a courier accepts this delivery
      courier: 'Bob the builda',
        items: [Product(), Product()],
        cost: "50",
        pickup: "asdasd",
        dropoff: "asdasdasd",
        window: 1,
        current_location: LatLng(56.000, 60.998)),
    Delivery(
      //fullfilled is a test variable
      // fullfilled can only be updated by a courier
      fulfilled: true,
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

  int get countUnfullfilled {
    List<Delivery> unfullfilled= new List<Delivery>();
    for (var delivery in _deliveries){
      if(!delivery.fulfilled){
        unfullfilled.add(delivery);
      }
    }

    return unfullfilled.length;
  }
  int get countInProgress {
    List<Delivery> inprogress= new List<Delivery>();
    for (var delivery in _deliveries){
      if(delivery.courier !=null){
        inprogress.add(delivery);
      }
    }

    return inprogress.length;
  }

  int get countfullfilled {
    List<Delivery> fullfilled= new List<Delivery>();
    for (var delivery in _deliveries){
      if(delivery.fulfilled){
        fullfilled.add(delivery);
      }
    }

    return fullfilled.length;
  }
}
