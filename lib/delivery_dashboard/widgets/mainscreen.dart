import 'package:flutter/material.dart';
import './deliveries.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Deliveries(),
              // Expanded(
              //   flex: 1,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(vertical: 100),
              //     color: Colors.black12,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: <Widget>[
              //         Container(
              //           color: Colors.blue,
              //           child: FittedBox(
              //             child: Text(
              //               'deliveries1',
              //               style: TextStyle(color: Colors.black),
              //             ),
              //           ),
              //         ),
              //         Text(
              //           'morning route',
              //           style: TextStyle(color: Colors.black),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.red,
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
