import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/delivery.dart';

class OrderListItem extends StatefulWidget {
  final delivery;

  const OrderListItem({this.delivery});

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

var passwordToMatch;

class _OrderListItemState extends State<OrderListItem> {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ]),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Flex(
          direction: device.width > 400 ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.add_box, size: 56.0),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.delivery.recipient,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand'),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        widget.delivery.items.length.toString() + ' items',
                        style: TextStyle(
                            // fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (device.width > 400)
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 250),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.delivery.fulfilled
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status:Delivered',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand'),
                              ),
                              Text(
                                'at ${widget.delivery.deliveredAtTime.toString()}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand'),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status: In Progress',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand'),
                              ),
                              Text(
                                'at ${widget.delivery.deliveredAtTime.toString()}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand'),
                              )
                            ],
                          ),
                    SizedBox(width: 8),
                    widget.delivery.fulfilled
                        ? Icon(
                            Icons.check_circle,
                            color: Color(0xFF36814A),
                            size: 46.0,
                          )
                        : Icon(
                            Icons.swap_horizontal_circle,
                            color: Color(0xFF009A9A),
                            size: 46.0,
                          )
                  ],
                ),
              ),
            if (device.width < 400)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Color(0xFF36814A),
                    size: 46.0,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Status:Delivered',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
