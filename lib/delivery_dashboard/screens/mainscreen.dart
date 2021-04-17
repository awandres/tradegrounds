import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/status.dart';
import '../widgets/status.dart';
import '../widgets/order_list.dart';
import '../widgets/neworder.dart';
import '../providers/dashboard_provider.dart';

class MainScreen extends StatelessWidget {
  Duration _duration = Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context);
    double height = MediaQuery.of(context).size.height;
    int _flex1 = dash.orderListExpanded ? 0 : 3,
        _flex2 = dash.orderListExpanded ? 8 : 6,
        _flex3 = dash.orderListExpanded ? 0 : 8;

    var height1 = (_flex1 * height) / (_flex1 + _flex2 + _flex3);
    var height2 = (_flex2 * height) / (_flex1 + _flex2 + _flex3);
    var height3 = (_flex3 * height) / (_flex1 + _flex2 + _flex3);
    var expandedList = false;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 780, maxHeight: height * .8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (!dash.orderListExpanded)
              // Expanded(
              //   flex: 3,
              //   child: Status(),
              // ),
              AnimatedContainer(
                duration: _duration,
                curve: Curves.easeOut,
                height: height1,
                child: Status(),
              ),
            // Expanded(
            //   flex: dash.orderListExpanded ? 10 : 4,
            //   child: OrderList(),
            // ),
            AnimatedContainer(
              constraints: BoxConstraints(maxHeight: height - 350),
              duration: _duration,
              curve: Curves.easeInOutQuart,
              height: height2,
              child: OrderList(),
            ),
            if (!dash.orderListExpanded)
              // Expanded(
              //   flex: 2,
              //   child: NewOrder(),
              // ),
              AnimatedContainer(
                constraints: BoxConstraints(maxHeight: isLandscape ? 150 : 270),
                duration: _duration,
                curve: Curves.easeOut,
                height: height3,
                child: NewOrder(),
              )
          ],
        ),
      ),
    );
  }
}
