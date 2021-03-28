import 'package:flutter/material.dart';
import 'status.dart';
import 'deliveries.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Status(),
              Deliveries(),
              Expanded(
                flex: 3,
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
      )
    );
  }
}
