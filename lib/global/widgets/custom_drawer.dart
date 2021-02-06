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
                _buildDrawerOption(
                  Icon(Icons.dashboard),
                  'Home',
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourierCentral(),
                    ),
                  ),
                ),
                _buildDrawerOption(
                  Icon(Icons.supervised_user_circle, color: Colors.deepPurple),
                  'Find Your Calling',
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
                  'Convo',
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourierCentral(),
                    ),
                  ),
                ),
                _buildDrawerOption(
                  Icon(Icons.add_location),
                  'Search Criteria',
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
                    'Level Up AuRa',
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
