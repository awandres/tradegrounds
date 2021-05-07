import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../providers/product_provider.dart';
import './product_list_item.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final productService = Provider.of<ProductProvider>(context);
    String date =
        new DateFormat.yMMMMEEEEd().format(new DateTime.now()).toString();
    return Container(
      padding: device.width > 400
          ? EdgeInsets.symmetric(horizontal: 30, vertical: 20)
          : EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 330),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color(0xFF009A9A),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ]),
          padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 60),
                    Align(
                      alignment: Alignment.topCenter,
                      child: TextButton(
                        onPressed: () {
                          print('showing full list');
                        },
                        child: Text(
                          'Product Log',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Quicksand',
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FlatButton.icon(
                        onPressed: () => ({productService.toggleListMode()}),
                        icon: Icon(
                          Icons.view_carousel_rounded,
                          color: Colors.white,
                          size: 34.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        label: Text(''),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Active',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Quicksand',
                            letterSpacing: 1),
                      ),
                      StreamBuilder<Object>(
                          stream: Firestore.instance
                              .collection('productCenter')
                              .document('kZ4sfVH81MRX0m91UcRkJlI949q1')
                              .collection('activeProductList')
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot productCenterSnapshot) {
                            if (productCenterSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.lightBlueAccent,
                                ),
                              );
                            } else
                              return Column(
                                children: productCenterSnapshot.data.documents
                                    .map<Widget>((_product) {
                                  return ProductListItem(
                                    product: _product,
                                  );
                                }).toList(),
                              );
                          }),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Text(
                          'Inactive',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Quicksand',
                              letterSpacing: 1),
                        ),
                      ),
                      StreamBuilder<Object>(
                          stream: Firestore.instance
                              .collection('productCenter')
                              .document('kZ4sfVH81MRX0m91UcRkJlI949q1')
                              .collection('inactiveProductList')
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot productCenterSnapshot) {
                            if (productCenterSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.lightBlueAccent,
                                ),
                              );
                            } else
                              return Column(
                                children: productCenterSnapshot.data.documents
                                    .map<Widget>((_product) {
                                  return ProductListItem(
                                    product: _product,
                                  );
                                }).toList(),
                              );
                          }),
                    ],
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {
                      productService.toggleProductListExpanded();
                    },
                    child: Text(
                      productService.productListExpanded
                          ? 'CLOSE'
                          : 'SEE IN FULL VIEW',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 5,
                          fontFamily: 'Quicksand'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
