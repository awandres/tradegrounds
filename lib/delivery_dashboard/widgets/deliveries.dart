import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/models/delivery.dart';

import '../providers/window.dart';
import 'package:intl/intl.dart';

class Deliveries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final current_window = Provider.of<Window>(context);
    String date =
        new DateFormat.yMMMMEEEEd().format(new DateTime.now()).toString();
    return Expanded(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          padding: device.width < 800 ? EdgeInsets.all(20) : EdgeInsets.all(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // FittedBox(
              //   fit: BoxFit.fitHeight,
              // child:
              Stack(
                alignment: AlignmentDirectional.center,
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    child: Text(
                      current_window.deliveryCount.toString(),
                      strutStyle: StrutStyle(
                        forceStrutHeight: true,
                      ),
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Pacifico',
                          fontSize: 50),
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    child: Text(
                      'Deliveries',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  )
                ],
              ),
              // ),
              SizedBox(width: 30),
              FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      date,
                      style: TextStyle(
                          // fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                    ),
                    Text(
                      current_window.status,
                      style: TextStyle(fontFamily: 'Pacifico'),
                    ),
                    Text(
                      'In Progress',
                      style: TextStyle(fontFamily: 'Quicksand'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
