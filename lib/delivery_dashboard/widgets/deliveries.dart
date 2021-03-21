import 'dart:ui';

import 'package:flutter/material.dart';

class Deliveries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Expanded(
        flex: 2,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            padding: device.width<800? EdgeInsets.all(20): EdgeInsets.all(40),
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
                            child: Text('13',
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
                            bottom: -15,
                            child: Text(
                              'deliveries',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 10
                            ),
                          ),
                        )
                      ],
                    ),
                // ),
                SizedBox(width:30),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'March 20th 2021',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'
                        ),
                      ),
                      Text(
                        'Morning route',
                        style: TextStyle(
                          fontFamily: 'Pacifico'
                        ),
                      ),
                      Text(
                        'In Progress',
                        style: TextStyle(
                          fontFamily: 'Quicksand'
                        ),
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