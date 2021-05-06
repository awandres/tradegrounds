import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/posts_model.dart';
import '../models/product.dart';

class PostsCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Product> products;

  PostsCarousel({this.pageController, this.title, this.products});

  _buildPost(BuildContext context, int index) {
    Product product = products[index];
    return Text('Carousel');
  }

  @override
  Widget build(BuildContext context) {
    return Text('Carousel');
  }
}
