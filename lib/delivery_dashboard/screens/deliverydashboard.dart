import 'package:flutter/material.dart';
import '../../global/widgets/custom_drawer.dart';

class DeliveryDashboard extends StatefulWidget {
  @override
  _DeliveryDashboardState createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

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
      body: Text('USER DASH'),
    );
  }
}
