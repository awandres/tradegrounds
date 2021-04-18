import 'package:latlng/latlng.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:storegrounds/delivery_dashboard/widgets/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/delivery.dart';
import '../models/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashboardProvider with ChangeNotifier {
  String status = "Morning Route";
  bool _orderListExpanded = false;
  final _auth = FirebaseAuth.instance;

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

  Dashboard dashboard = Dashboard(completedDelivieres: [
    Delivery(
      itemCount: 2,
      recipient: 'John Stamos ',
      deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
      fulfilled: true,
    ),
    Delivery(
      itemCount: 3,
      recipient: 'John Stamos 2',
      deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
      fulfilled: true,
    ),
  ], deliveriesInProgress: [
    Delivery(
      itemCount: 2,
      recipient: 'Carl Sagan 1',
      deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
      estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
      fulfilled: false,
    ),
    Delivery(
      itemCount: 3,
      recipient: 'Carl Sagan 2',
      estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
      fulfilled: false,
    ),
    Delivery(
      itemCount: 5,
      recipient: 'Carl Sagan 3',
      estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
    ),
    Delivery(
      itemCount: 1,
      recipient: 'Carl Sagan 4',
      estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
    ),
  ]);

  List<Delivery> get deliveries {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._deliveries];
  }

  List get completedDeliveries => dashboard.completedDelivieres;
  List get deliveriesInProgress => dashboard.deliveriesInProgress;
  bool get orderListExpanded => _orderListExpanded;
  // get userId => await _auth.currentUser();

  Future getUserId() async {
    AuthResult authResult;
    return authResult.user.uid;
    ;
  }

  int get deliveryCount {
    return _deliveries.length;
  }

  void setStatus() {}

  int get countUnfullfilled {
    List<Delivery> unfullfilled = new List<Delivery>();
    for (var delivery in _deliveries) {
      if (!delivery.fulfilled) {
        unfullfilled.add(delivery);
      }
    }

    return unfullfilled.length;
  }

  int get countInProgress {
    List<Delivery> inprogress = new List<Delivery>();
    for (var delivery in _deliveries) {
      if (delivery.courier != null) {
        inprogress.add(delivery);
      }
    }

    return inprogress.length;
  }

  int get countfullfilled {
    List<Delivery> fullfilled = new List<Delivery>();
    for (var delivery in _deliveries) {
      if (delivery.fulfilled) {
        fullfilled.add(delivery);
      }
    }

    return fullfilled.length;
  }

  void toggleOrderListExpanded() {
    _orderListExpanded = !_orderListExpanded;
    notifyListeners();
  }
}
