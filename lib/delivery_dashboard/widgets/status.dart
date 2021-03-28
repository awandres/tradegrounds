import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/models/delivery.dart';
import '../providers/window.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final current_window = Provider.of<Window>(context);
    String date = new DateFormat.yMMMMEEEEd().format(new DateTime.now()).toString();
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top :10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 5,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Container(
                            margin: const EdgeInsets.only(left:30),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Positioned(
                                  child: Text(
                                    current_window.delveryCount.toString(),
                                    strutStyle: StrutStyle(
                                      forceStrutHeight: true,
                                    ),
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Pacifico',
                                      fontSize: 50
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: -28,
                                    child: Text(
                                      'Deliveries',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                date,
                                style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand'
                                ),
                              ),
                              Text(
                                current_window.status,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Pacifico'
                                ),
                              ),
                              Text(
                                'In Progress',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Quicksand'
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
            ),
            SizedBox(height:20),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                  child: new LinearPercentIndicator(
                  // width: constraints.maxWidth - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: 0.8,
                  center: Text("80.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.green,
                ),
              ),
            ),
            SizedBox(height:8),
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text(
                    '6 delivered, 7 in Progress',
                    style: TextStyle(fontSize:18),
                  ),
                ),
              ),
            ),
          ] 
        ),
      ),
    );
  }
}