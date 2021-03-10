import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/screens/page1.dart';
import 'package:storegrounds/delivery_dashboard/screens/page2.dart';
import 'package:storegrounds/delivery_dashboard/screens/page3.dart';
import '../../global/widgets/custom_drawer.dart';

class DeliveryDashboard extends StatefulWidget {
  @override
  _DeliveryDashboardState createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  final List<Widget> _pages =[
    PageOne(),
    PageTwo(),
    PageThree()

  ];

  int _selectedPageIndex =0;

  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Center(
          child: Align(
            alignment: Alignment(-0.2, 0.0),
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage ,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.storefront), 
            title: Text('Jobs')
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.grid_view), 
            title: Text('Main')
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.location_on), 
            title: Text('Location')
          ),
        ],
      ),
    );
  }
}
