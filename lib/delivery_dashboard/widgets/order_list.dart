import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/models/delivery.dart';

import '../providers/dashboard_provider.dart';
import 'package:intl/intl.dart';
import '../models/delivery.dart';
import './order_list_item.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;

    List<Delivery> _completedDeliveries = [
      Delivery(
        items: [Product(), Product()],
        recipient: 'John Stamos ',
        deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
        estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
        fulfilled: true,
      ),
      Delivery(
        items: [Product(), Product(), Product()],
        recipient: 'John Stamos 2',
        deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
        estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
        fulfilled: true,
      ),
    ];

    List<Delivery> _deliveriesInProgress = [
      Delivery(
        items: [Product(), Product()],
        recipient: 'Carl Sagan 1',
        deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
        estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
        fulfilled: false,
      ),
      Delivery(
        items: [Product(), Product(), Product()],
        recipient: 'Carl Sagan 2',
        deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
        estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
        fulfilled: false,
      ),
      Delivery(
        items: [Product(), Product(), Product(), Product(), Product()],
        recipient: 'Carl Sagan 3',
        deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
        estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
      ),
      Delivery(
        items: [
          Product(),
        ],
        recipient: 'Carl Sagan 4',
        deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
        estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
      ),
    ];
    final current_window = Provider.of<DashboardProvider>(context);
    String date =
        new DateFormat.yMMMMEEEEd().format(new DateTime.now()).toString();
    return Container(
      padding: device.width > 400
          ? EdgeInsets.symmetric(horizontal: 30, vertical: 20)
          : EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 330),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color(0xFF009A9A),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ]),
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Just Finished',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Quicksand',
                      letterSpacing: 1),
                ),
                Column(
                  children: _completedDeliveries.map((_delivery) {
                    return OrderListItem(delivery: _delivery);
                  }).toList(),
                ),
                Text(
                  'Up Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Quicksand',
                      letterSpacing: 1),
                ),
                Column(
                  children: _deliveriesInProgress.map((_delivery) {
                    return OrderListItem(delivery: _delivery);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
