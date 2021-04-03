import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/models/delivery.dart';

import '../providers/dashboard_provider.dart';
import 'package:intl/intl.dart';
import '../models/delivery.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;

    List<Delivery> _deliveries = [
      Delivery(
        items: [Product(), Product()],
        recipient: 'John Stamos 1',
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
      Delivery(
        items: [Product(), Product(), Product(), Product(), Product()],
        recipient: 'John Stamos 3',
        deliveredAtTime: new DateFormat.jm().format(new DateTime.now()),
        estimatedDeliveryTime: new DateFormat.jm().format(new DateTime.now()),
      ),
      Delivery(
        items: [
          Product(),
        ],
        recipient: 'John Stamos 4',
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
              children: _deliveries.map((delivery) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ]),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Flex(
                      direction:
                          device.width > 400 ? Axis.horizontal : Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.add_box, size: 56.0),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    delivery.recipient,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Quicksand'),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    delivery.items.length.toString() + ' items',
                                    style: TextStyle(
                                        // fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Quicksand'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (device.width > 400)
                          ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 250),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                delivery.fulfilled
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Status:Delivered',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Quicksand'),
                                          ),
                                          Text(
                                            'at ${delivery.deliveredAtTime.toString()}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Quicksand'),
                                          )
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Status: In Progress',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Quicksand'),
                                          ),
                                          Text(
                                            delivery.estimatedDeliveryTime
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Quicksand'),
                                          )
                                        ],
                                      ),
                                SizedBox(width: 8),
                                delivery.fulfilled
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF36814A),
                                        size: 46.0,
                                      )
                                    : Icon(
                                        Icons.swap_horizontal_circle,
                                        color: Color(0xFF009A9A),
                                        size: 46.0,
                                      )
                              ],
                            ),
                          ),
                        if (device.width < 400)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Color(0xFF36814A),
                                size: 46.0,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Status:Delivered',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand'),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
