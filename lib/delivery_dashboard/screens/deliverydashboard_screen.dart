import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/screens/billingpayment_screen.dart';
import 'package:storegrounds/delivery_dashboard/screens/deliverycalender_screen.dart';
import 'package:storegrounds/delivery_dashboard/widgets/mainscreen.dart';
import 'package:storegrounds/delivery_dashboard/widgets/productcenter.dart';
import 'package:storegrounds/delivery_dashboard/widgets/mycourier.dart';
import 'package:drawer/widgets/custom_drawer.dart';
import 'package:storegrounds/delivery_dashboard/screens/settings_screen.dart';

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
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(_pages[_currentPageIndex]['title']),
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
              icon: Icon(Icons.storefront),
              title: Text(
                'Product Center',
                style: TextStyle(fontFamily: 'Quicksand'),
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.dashboard),
              title: Text(
                'Dashboard',
                style: TextStyle(fontFamily: 'Quicksand'),
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.location_on),
              title: Text(
                'My Courier',
                style: TextStyle(fontFamily: 'Quicksand'),
              )),
        ],
      ),
    );
  }
}
