import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'deliveries.dart';
import './status.dart';
>>>>>>> e6cc1c71ccfe732e6ead804b06d5d854c4317106

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Container(
      child: Center(child: Text('Main Screen'),),
    );
  }
}
=======
    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Deliveries(),
              Status(),
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
>>>>>>> e6cc1c71ccfe732e6ead804b06d5d854c4317106
