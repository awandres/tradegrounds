import 'dart:ui';

import 'package:flutter/material.dart';

class Deliveries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(device.width/20),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: Colors.blue,
                child: FittedBox(
                  child: Text(
                    ' 13 deliveries',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Text(
                'Window Information',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      );
  }
}