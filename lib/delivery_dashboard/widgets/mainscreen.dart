import 'package:flutter/material.dart';
import './deliveries.dart';
import './status.dart';
import 'order_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Deliveries(),
            // Status(),
            OrderList(),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.redAccent,
                child: Row(
                  children: <Widget>[
                    Text(
                      'deliveries',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'morning route',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ]),
    ));
  }
}
