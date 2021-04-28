import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/status.dart';
import '../widgets/status.dart';
import '../widgets/order_list.dart';
import '../widgets/neworder.dart';
import '../providers/dashboard_provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context);

    var expandedList = false;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 780),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (!dash.orderListExpanded)
              Expanded(
                flex: 3,
                child: Status(),
              ),
            Expanded(
              flex: dash.orderListExpanded ? 10 : 4,
              child: OrderList(),
            ),
            if (!dash.orderListExpanded)
              Expanded(
                flex: 2,
                child: NewOrder(),
              ),
          ],
        ),
      ),
    );
  }
}
