import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:storegrounds/product_center/models/product_center.dart';
import '../widgets/product_list.dart';
import '../widgets/product_stats.dart';
import '../widgets/new_product_btn.dart';
import '../screens/new_product_screen.dart';
import '../providers/product_provider.dart';

class ProductCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var expandedList = false;
    final productService = Provider.of<ProductProvider>(context);
    return StreamBuilder<Object>(
        stream: Firestore.instance.collection('productCenter').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          } else
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: ProductList(
                        productSnapshotData: snapshot,
                      ),
                    ),
                    if (!productService.productListExpanded)
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(children: [
                            ProductStats(),
                            SizedBox(width: 50),
                            NewProductBtn()
                          ]),
                        ),
                      )
                  ],
                ),
              ),
            );
        });
  }
}
