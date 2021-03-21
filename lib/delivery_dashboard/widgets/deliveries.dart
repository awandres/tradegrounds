import 'dart:ui';

import 'package:flutter/material.dart';

class Deliveries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Expanded(
        flex: 2,
        child: FittedBox(
          fit: BoxFit.contain,
          // padding: EdgeInsets.all(device.width/10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FittedBox( 
                fit: BoxFit.contain, 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          '13',
                          style: TextStyle(
                            color: Colors.green,

                            fontFamily: 'Pacifico'
                          ),
                        ),
                      ),
                    
                      FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          ' Deliveries',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                ),
              ),
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
      );
  }
}