import 'package:flutter/material.dart';
import 'package:storegrounds/delivery_dashboard/models/delivery.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final current_window = Provider.of<DashboardProvider>(context);
    String date = new DateFormat.yMMMMEEEEd().format(new DateTime.now()).toString();
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                // color: Colors.red,
                 padding: EdgeInsets.only(left:15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // FittedBox(
                    //   fit: BoxFit.fitHeight,
                    // child:
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          child: Text(
                            current_window.deliveryCount.toString(),
                            strutStyle: StrutStyle(
                              forceStrutHeight: true,
                            ),
                            style: TextStyle(
                                color: Color(0xFF009A9A),
                                fontFamily: 'Pacifico',
                                fontSize: 50),
                          ),
                        ),
                        Positioned(
                          bottom: -15,
                          child: Text(
                            'Deliveries',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    // ),
                    SizedBox(width: 30),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            date,
                            style: TextStyle(
                                // fontSize: 19,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand'),
                          ),
                          Text(
                            current_window.status,
                            style: TextStyle(fontFamily: 'Pacifico'),
                          ),
                          Text(
                            'In Progress',
                            style: TextStyle(fontFamily: 'Quicksand'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
          ),
        ),
        Expanded(
          flex:1,
            child: Container(
              // color: Colors.red,
            padding: EdgeInsets.only(left:35, right: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 20,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: current_window.countfullfilled/current_window.deliveryCount,
                      center: Text(
                        '${current_window.countfullfilled/current_window.deliveryCount*100}%',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Color(0xFF009A9A),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Container(
                      padding: EdgeInsets.only(left:15),
                      child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        text: '${current_window.countfullfilled} Delivered, ',
                        children: <TextSpan>[
                          TextSpan(
                            text: '${current_window.countInProgress} in Progress',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                  ),
                    ),
                  ),
                )
              ]
            )
          )
        ) 
      ],
    );
  }
}

