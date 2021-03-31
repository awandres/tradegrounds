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
                          child: FittedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  tooltip: 'Increase volume by 10',
                                ),
                                Icon(Icons.circle, ),
                                Text('New Order')
                              ],
                            )
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
