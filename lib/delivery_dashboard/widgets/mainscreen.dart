import 'package:flutter/material.dart';
import 'status.dart';
import './status.dart';
import 'order_list.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 780),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Status(),
              ),
              Expanded(
                flex: 4,
                child:OrderList()
              ),
              Expanded(
                flex: 2,
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
              ),
          ]),
    ));
  }
}
