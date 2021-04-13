import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/screens/billingpayment_screen.dart';
import 'package:storegrounds/delivery_dashboard/screens/deliverycalendar_screen.dart';
import 'file:///D:/Tradegrounds/storegrounds/storegrounds/storegrounds/lib/delivery_dashboard/screens/mainscreen.dart';
import 'file:///D:/Tradegrounds/storegrounds/storegrounds/storegrounds/lib/product_center/screens/product_center.dart';
import 'package:storegrounds/delivery_dashboard/widgets/mycourier.dart';
import 'package:storegrounds/global/widgets/custom_drawer.dart';
import 'file:///D:/Tradegrounds/storegrounds/storegrounds/storegrounds/lib/settings/screens/settings_screen.dart';

class DeliveryDashboard extends StatefulWidget {
  @override
  _DeliveryDashboardState createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard>
    with SingleTickerProviderStateMixin {
  final List<Map<String, Object>> _pages = [
    {'title': 'Product Center', 'screen': ProductCenterScreen()},
    {'title': 'Delivery Dashboard', 'screen': MainScreen()},
    {'title': 'My Courier', 'screen': MyCourierScreen()},
    {'title': 'Delivery Calendar', 'screen': DeliveryCalendarScreen()},
    {'title': 'Billing/Payment', 'screen': BillingPaymentScreen()},
    {'title': 'Settings', 'screen': SettingsScreen()}
  ];

  int _currentPageIndex = 1;

// this function is called in the bottom navigation bar to change page index
  void _navbarpageselector(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

// this function is called in the custom drawer to change page index
  void drawerPageSelector(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 120.0,
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _pages[_currentPageIndex]['title'],
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.w700,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(_pages, _currentPageIndex, drawerPageSelector),
      body: _pages[_currentPageIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _navbarpageselector,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _currentPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.storefront,
                  size: 32.0,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'PRODUCT CENTER',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.dashboard,
                  size: 32.0,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'DASHBOARD',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.location_on,
                  size: 32.0,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'MY COURIER',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
