import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/models/delivery.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/dashboard_provider.dart';
import 'package:intl/intl.dart';
import '../models/delivery.dart';
import '../models/dashboard.dart';
import 'dart:convert';

import './order_list_item.dart';

class OrderList extends StatefulWidget {
  final AsyncSnapshot dashSnapshotData;
  const OrderList({this.dashSnapshotData});

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final dashData = widget.dashSnapshotData;
    // final futureDashData = dashData.data.reference
    //     .collection('deliveriesInProgress')
    //     .getDocuments();

    // print(dashData.data.reference
    //     .collection('deliveriesInProgress')
    //     .getDocuments()
    //     .data
    //     .map((delivery) => print(delivery['recipient'])));
    // print(dashData.data.reference
    //     .collection('deliveriesInProgress')
    //     .get()
    //     .map((delivery) => print(delivery['recipient'])));
    print('decoding');

    // final Map<String, dynamic> decodedData = json.decode(dashData.toString());

    // print(decodedData);

    // dashData['completedDeliveries'].map((doc) => print(doc));
    // dashData.documents.map((doc) => print(doc['recipient'])).toList();

    final device = MediaQuery.of(context).size;
    final dash = Provider.of<DashboardProvider>(context);
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
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ListView(children: [
                  Column(
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
                      StreamBuilder<Object>(
                          stream: Firestore.instance
                              .collection('dashboard')
                              .document('vXiaxOg1nYZsqhOSCNwrKhziYEu1')
                              .collection('completedDeliveries')
                              .snapshots(),
                          builder: (context, AsyncSnapshot deliverySnapshot) {
                            if (deliverySnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.lightBlueAccent,
                                ),
                              );
                            } else
                              return Column(
                                children: deliverySnapshot.data.documents
                                    .map<Widget>((_delivery) {
                                  return OrderListItem(
                                    delivery: _delivery,
                                  );
                                }).toList(),
                              );
                          }),
                      Text(
                        'Up Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Quicksand',
                            letterSpacing: 1),
                      ),
                      StreamBuilder<Object>(
                          stream: Firestore.instance
                              .collection('dashboard')
                              .document('vXiaxOg1nYZsqhOSCNwrKhziYEu1')
                              .collection('deliveriesInProgress')
                              .snapshots(),
                          builder: (context, AsyncSnapshot deliverySnapshot) {
                            if (deliverySnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.lightBlueAccent,
                                ),
                              );
                            } else
                              return Column(
                                children: deliverySnapshot.data.documents
                                    .map<Widget>((_delivery) {
                                  // return Text(_delivery['recipient']);
                                  return OrderListItem(delivery: _delivery);
                                }).toList(),
                              );
                          }),
                    ],
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {
                      dash.toggleOrderListExpanded();
                    },
                    child: Text(
                      dash.orderListExpanded ? 'CLOSE' : 'SEE IN FULL VIEW',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 5,
                          fontFamily: 'Quicksand'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
