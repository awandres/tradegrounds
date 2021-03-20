import 'package:flutter/material.dart';
import './deliveries.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top:30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.black,
              child: Row( 
                children: <Widget>[
                  Text('deliveries',style: TextStyle(color: Colors.white),),
                  Text('morning route', style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
              child: Row( 
                children: <Widget>[
                  Text('deliveries',style: TextStyle(color: Colors.white),),
                  Text('morning route', style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}