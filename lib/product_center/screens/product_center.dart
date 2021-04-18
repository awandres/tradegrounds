import 'package:flutter/material.dart';
import '../widgets/product_list.dart';
import '../widgets/product_stats.dart';
import '../widgets/new_product.dart';

class ProductCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 780),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: ProductList(),
            ),
            Expanded(
              flex: 2,
              child: Row(children: [
                ProductStats(),
                NewProduct(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
