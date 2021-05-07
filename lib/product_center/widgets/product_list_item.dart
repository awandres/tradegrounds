import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductListItem extends StatefulWidget {
  final product;

  const ProductListItem({this.product});

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

var passwordToMatch;

class _OrderListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Opacity(
      opacity: widget.product['active'] ? 1 : .9,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: widget.product['active'] ? Colors.white : Color(0xFFE0E0E0),
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
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Flex(
            direction: device.width > 400 ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 15),
                  Icon(
                    Icons.edit,
                    size: 35,
                  ),
                  SizedBox(width: 15),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 150, maxWidth: 180),
                    child: Image.asset(
                      widget.product['imageUrl'] != null
                          ? widget.product['imageUrl']
                          : 'assets/images/storegroundsLogo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.product['name'],
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                              color: Colors.green,
                            ),
                            text: '${widget.product['cost']}',
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' + Tax',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Delivery Cost Space + ${widget.product['deliveryCost']}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'SKU#${widget.product['sku']}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${widget.product['amountDelivered']} delivered',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Specs',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Flat Height',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Easy Weight',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Insured \$${widget.product['amountInsured']}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'No Age Verification',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Signature Required',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
