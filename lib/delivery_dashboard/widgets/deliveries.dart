import 'package:flutter/material.dart';
import 'progressBar.dart';


class Deliveries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          
          Expanded(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.all(10),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    flex:8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      margin: EdgeInsets.only( bottom: 5,top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('adsasd'),
                          Text('asdasd')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex:8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      margin: EdgeInsets.only( bottom: 5,top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('adsasd'),
                          Text('asdasd')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex:8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      margin: EdgeInsets.only( bottom: 5,top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('adsasd'),
                          Text('asdasd')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          )
        ]
      )
    );
  
  }
}