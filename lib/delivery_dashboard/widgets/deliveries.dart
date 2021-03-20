import 'package:flutter/material.dart';

class Deliveries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(20),
      child: Row( 
        children: <Widget>[
          Text('deliveries',style: TextStyle(color: Colors.white),),
          Text('morning route', style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}