import 'dart:math';
import 'package:flutter/material.dart';
import 'package:storegrounds/courier_central/screens/couriercentral.dart';
import 'package:authentication/providers/auth.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Quicksand',
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 90),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(22),
                        child: CircleAvatar(radius: 32,)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Testing Inc',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            'Customers Served',
                            style: TextStyle(fontFamily:'Quicksand',),
                          ),
                          Text(
                            'Deliveries Made',
                            style: TextStyle(fontFamily:'Quicksand',),
                          ),
                      
                        ],
                      )
                    ],
                  ),
                ),
                _buildDrawerOption(
                  Icon(Icons.dashboard),
                  'Delivery Dashboard',
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourierCentral(),
                    ),
                  ),
                ),
                _buildDrawerOption(
                  Icon(Icons.supervised_user_circle, color: Colors.deepPurple),
                  'Delivery Calendar',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourierCentral(),
                      // user will need to build to x screen i.e. Homescreen, etc.
                    ),
                  ),
                ),
                _buildDrawerOption(
                  Icon(Icons.chat),
                  'Product Center',
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourierCentral(),
                    ),
                  ),
                ),
                _buildDrawerOption(
                  Icon(Icons.add_location),
                  'MyCourier',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourierCentral(),
                    ),
                  ),
                ),
                _buildDrawerOption(
                    Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                    'Billing/Payments',
                    () {}),
                _buildDrawerOption(Icon(Icons.settings), 'Settings', () {}),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child:
                  _buildDrawerOption(Icon(Icons.directions_run), 'Logout', () {
                //logoutUser = true;
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
                Provider.of<Auth>(context, listen: false).logout();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
