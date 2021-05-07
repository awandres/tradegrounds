import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_list.dart';
import '../widgets/products_carousel.dart';
import '../widgets/product_stats.dart';
import '../widgets/new_product_btn.dart';
import '../screens/new_product_screen.dart';
import '../providers/product_provider.dart';

class ProductCenterScreen extends StatefulWidget {
  @override
  _ProductCenterScreenState createState() => _ProductCenterScreenState();
}

class _ProductCenterScreenState extends State<ProductCenterScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    var expandedList = false;
    final productService = Provider.of<ProductProvider>(context);
    bool listMode = true;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1000),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 8,
              child: productService.listMode
                  ? ProductList()
                  : ProductsCarousel(
                      pageController: _pageController,
                      title: 'Products',
                      products: productService.activeProductList,
                    )),
          if (!productService.productListExpanded || !productService.listMode)
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  ProductStats(),
                  SizedBox(width: 50),
                  NewProductBtn(),
                ]),
              ),
            )
        ],
      ),
    );
  }
}
