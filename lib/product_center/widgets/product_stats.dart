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
                      text:'2 ', 
                      style: TextStyle(fontSize:19,color:Color(0xFF009A9A),),
                      children: <TextSpan>[
                        TextSpan(
                          text:'Active Products', 
                          style: TextStyle(
                            fontSize:18,color:Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  Text.rich(
                    TextSpan(
                      text:'4 ', 
                      style: TextStyle(fontSize:19,color:Color(0xFF009A9A),),
                      children: <TextSpan>[
                        TextSpan(
                          text:'Inactive Products', 
                          style: TextStyle(
                            fontSize:18,color:Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),

                  Text.rich(
                    TextSpan(
                      text:'23 ', 
                      style: TextStyle(fontSize:19,color:Color(0xFF009A9A),),
                      children: <TextSpan>[
                        TextSpan(
                          text:'Deliveries this week', 
                          style: TextStyle(
                            fontSize:18,color:Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text:'23 ', 
                      style: TextStyle(fontSize:19,color:Color(0xFF009A9A),),
                      children: <TextSpan>[
                        TextSpan(
                          text:'Deliveries this week', 
                          style: TextStyle(
                            fontSize:18,color:Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text:'277 ', 
                      style: TextStyle(fontSize:19,color:Color(0xFF009A9A),),
                      children: <TextSpan>[
                        TextSpan(
                          text:'Deliveries Total', 
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
