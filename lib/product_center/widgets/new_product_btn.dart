import 'package:flutter/material.dart';
import '../screens/new_product_screen.dart';

class NewProductBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                      onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewProductScreen())
                        );
                      },
                      splashRadius: 20,
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
          Flexible(
            flex:1, 
            child: FittedBox( 
              fit: BoxFit.contain, 
              child: Text('New Product', style: TextStyle(fontSize:28),
              )
            )
          )
        ],
      )
    );
  }
}
