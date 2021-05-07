import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../models/posts_model.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductsCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List products;

  ProductsCarousel({this.pageController, this.title, this.products});

  _buildProduct(BuildContext context, int index) {
    final productService = Provider.of<ProductProvider>(context);
    var products = productService.activeProductList;
    var product = productService.activeProductList[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 600.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                product.imageUrl != null
                    ? product.imageUrl
                    : 'assets/images/storegroundsLogo.png',
                fit: BoxFit.fill,
                height: double.infinity,
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Container(
              padding: EdgeInsets.all(12.0),
              height: 160.0,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand'),
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
                        text: '${product.cost}',
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
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.check_box,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductProvider>(context);
    final device = MediaQuery.of(context).size;

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
              padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 2.0, 20.0),
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
                            onPressed: () =>
                                ({productService.toggleListMode()}),
                            icon: Icon(
                              Icons.list,
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
                  Container(
                    height: 400.0,
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildProduct(context, index);
                        }),
                  )
                ],
              ),
            )));
  }
}
