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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                              margin: EdgeInsets.only(bottom:30, left:20),
                              child: Material(
                                elevation: 10,
                                type: MaterialType.card,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    FittedBox( fit: BoxFit.contain ,child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Center(
                                        child: Text.rich(
                                        TextSpan(
                                          text:'\$1900\n', 
                                          style: TextStyle(fontSize:13,color:Color(0xFF009A9A),),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:'Estimate', 
                                              style: TextStyle(
                                                fontSize:10,color:Colors.black,
                                              ),
                                            )
                                            ],
                                          ),
                                        )
                                      )
                                    )),
                                    Positioned(
                                      right:12,
                                      top: 12,
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                        size: 24.0,
                                        semanticLabel: 'Text to announce in accessibility modes',
                                      ),
                                    ),
                                    
                                  ]
                                ),
                              ),
                            ),
                          
                        ),
                        SizedBox(width:50),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                flex:2,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Center(child: Material( elevation: 18, borderRadius: BorderRadius.all(Radius.circular(20)),child:  Icon(Icons.circle, color: Theme.of(context).primaryColor, size: 42,))),
                                      Center(
                                        child:  IconButton(
                                          iconSize: 35,
                                          icon: const Icon(Icons.add, color: Colors.white,),
                                          tooltip: 'Add New Order',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height:10),
                              Flexible(flex:1, child: FittedBox( fit: BoxFit.contain, child: Text('New Order', style: TextStyle(fontSize:28),)))
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
            
          ]),
    ));
  }
}
