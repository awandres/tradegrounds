import 'package:flutter/material.dart';

class ProductStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(bottom:30, left:20),
          child: Material(
            elevation: 10,
            type: MaterialType.card,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(left:48.0, top: 28, bottom: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                      'Product stats',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  
                  Text('Product stats'),
                  
                  Text('Product stats'),

                 Text('Product stats')
                ]
              ),
            )
          ),
        ),
    );
  }
}
