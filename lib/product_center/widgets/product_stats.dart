import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import 'package:intl/intl.dart';

class ProductStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stats= Provider.of<ProductProvider>(context);
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(bottom:30, left:20),
          child: Material(
            elevation: 10,
            type: MaterialType.card,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(left:48.0,  bottom: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                      '  Product Stats',
                      
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(height: 13,),
                  Text.rich(
                    TextSpan(
                      text:stats.activeProducts.toString(), 
                      style: TextStyle(fontSize:19,color:Color(0xFF009A9A),),
                      children: <TextSpan>[
                        TextSpan(
                          text:' Active Products', 
                          style: TextStyle(
                            fontSize:18,color:Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  Text.rich(
                    TextSpan(
                      text: stats.inactiveProducts.toString(), 
                      style: TextStyle(fontSize:19,color:Color(0xFF009A9A),),
                      children: <TextSpan>[
                        TextSpan(
                          text:' Inactive Products', 
                          style: TextStyle(
                            fontSize:18,color:Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),

                  Text.rich(
                    TextSpan(
                      text:stats.deliveriesThisWeek.toString(), 
                      style: TextStyle(fontSize:19,color:Color(0xFF009A9A),),
                      children: <TextSpan>[
                        TextSpan(
                          text:' Deliveries this week', 
                          style: TextStyle(
                            fontSize:18,color:Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text:stats.totalDeliveries.toString(), 
                      style: TextStyle(fontSize:19,color:Color(0xFF009A9A),),
                      children: <TextSpan>[
                        TextSpan(
                          text:' Deliveries Total', 
                          style: TextStyle(
                            fontSize:18,color:Colors.black,
                          ),
                        )
                      ],
                    ),
                  )
                ]
              ),
            )
          ),
        ),
    );
  }
}
