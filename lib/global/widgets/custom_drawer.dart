import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storegrounds/delivery_dashboard/screens/deliverycalendar_screen.dart';
import 'package:storegrounds/delivery_dashboard/screens/billingpayment_screen.dart';
import 'file:///D:/Tradegrounds/storegrounds/storegrounds/storegrounds/lib/settings/screens/settings_screen.dart';
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
          padding: EdgeInsets.all(20),
          child: ListTileTheme(
            selectedColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            child: ListTile(
              selected: true,
              dense: true,
              leading: icon,
              trailing: locked?Icon(Icons.lock):null,
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
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
          trailing: locked?Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.lock),
          ):null,
          title: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Quicksand',
              ),
            ),
          ),
          onTap: onTap,
        );
      }
    }
// ---------------------------------------------------------------------------------------
//-----------Main Drawer Widget is returned here------------------------------------------
// ---------------------------------------------------------------------------------------
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        elevation: 1.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(30),
                            child: CircleAvatar(radius: 42,)
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0,8.0),
                              child: Text(
                                'Testing Inc',
                                textScaleFactor: 1.5,
                                style: Theme.of(context).textTheme.title,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF009A9A),
                                  fontSize: 18.0,
                                ),
                                text: '200 ',
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Customers Served',
                                    style:  TextStyle(fontSize: 15, color: Colors.black, fontFamily:'Quicksand',),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF009A9A),
                                  fontSize: 18.0,
                                ),
                                text: '200 ',
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Deliveries made',
                                    style:  TextStyle(fontSize: 15, color: Colors.black, fontFamily:'Quicksand',),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
