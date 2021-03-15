import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storegrounds/delivery_dashboard/screens/deliverycalender.dart';
import 'package:storegrounds/delivery_dashboard/screens/billingpayment.dart';
import 'package:storegrounds/delivery_dashboard/screens/settings.dart';
import 'package:authentication/providers/auth.dart';

class CustomDrawer extends StatelessWidget {
  final List <Map<String,Object>> pages;
  final int currentPage;
  final Function pageselector;

  CustomDrawer(
    @required this.pages,
    @required this.currentPage,
    @required this.pageselector 
  );

  
  @override
  Widget build(BuildContext context) {

// ---------------------------------------------------------------------------
//----------------Builder function that creates drawer items -----------------
// --------------------------------------------------------------------------- 
    _buildDrawerOption(Icon icon, String title, Function onTap, bool locked) {
      // if drawer item is currently selected 
      if(title == pages[currentPage]['title']){
        return Container(
          color: Theme.of(context).primaryColor,
          child: ListTileTheme(
            selectedColor: Colors.white,
            child: ListTile(
              selected: true,
              dense: true,
              leading: icon,
              trailing: locked?Icon(Icons.lock):null,
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
              onTap: onTap,
            ),
          ),
        );
      }
      // if drawer item is currently not selected
      else{
        return ListTile(
          leading: icon,
          trailing: locked?Icon(Icons.lock):null,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Quicksand',
            ),
          ),
          onTap: onTap,
        );
      }
    }
// ---------------------------------------------------------------------------------------
//-----------Main Drawer Widget is returned here------------------------------------------
// ---------------------------------------------------------------------------------------
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
// ---------------------------------------------------------------------------------------
//-----------Drawer Items that dynamically change widgets on Delivery dashboard-----------
// ---------------------------------------------------------------------------------------
                _buildDrawerOption(
                  Icon(Icons.storefront),
                  pages[0]['title'],
                  () => pageselector(0),
                  true
                ),
                _buildDrawerOption(
                  Icon(Icons.dashboard),
                  pages[1]['title'],
                  () => pageselector(1),
                  false
                ),
                _buildDrawerOption(
                  Icon(Icons.location_on),
                  pages[2]['title'],
                  () => pageselector(2),
                  false
                ),
// ---------------------------------------------------------------------------
//----------------Drawer Items that route to Isolated Screens-----------------
// ---------------------------------------------------------------------------
                _buildDrawerOption(
                  Icon(Icons.calendar_today),
                  pages[3]['title'],
                  () => Navigator.push(
                    context,
  // since child widget screens are being pushed they need to have either appbar with back 
  // or Navigator.of(context).pop() to get back to dashboard 
                    MaterialPageRoute(
                      builder: (_) => DeliveryCalendarScreen(),
                    ),
                  ),
                  false
                ),
                _buildDrawerOption(
                  Icon(Icons.monetization_on),
                  pages[4]['title'],
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BillingPaymentScreen(),
                    ),
                  ),
                  true
                ),
                _buildDrawerOption(
                  Icon(Icons.settings), 
                  pages[5]['title'], 
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SettingsScreen(),
                    ),
                  ),
                  false
                ),
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
              }, false),
            ),
          ),
        ],
      ),
    );
  }
}
