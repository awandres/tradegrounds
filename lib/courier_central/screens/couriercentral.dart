import 'package:flutter/material.dart';
import 'file:///D:/Tradegrounds/storegrounds/storegrounds/storegrounds/lib/global/widgets/custom_drawer.dart';

class CourierCentral extends StatefulWidget {
  @override
  _CourierCentralState createState() => _CourierCentralState();
}

class _CourierCentralState extends State<CourierCentral>
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
      body: Text('get it done fellas!'
      ),
    );
  }
}
