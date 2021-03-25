import 'package:flutter/material.dart';
import './progressBar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return Container(
            child:Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: new LinearPercentIndicator(
                    width: constraints.maxWidth - 50,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2500,
                    percent: 0.8,
                    center: Text("80.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.green,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    '6 delivered, 7 in Progress',
                    style: TextStyle(fontSize:18),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    margin: EdgeInsets.all(25),
                    child: Column( children: <Widget>[

                    ],),
                  )
                )
              ]
            )
          );
        }
      ),
    );
  }
}