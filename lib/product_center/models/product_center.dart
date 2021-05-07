import 'package:latlng/latlng.dart';
import './product.dart';

class ProductCenter {
  int activeProducts;
  int inactiveProducts;
  int deliveriesThisWeek;
  int totalDeliveries;

  ProductCenter({
    this.activeProducts,
    this.inactiveProducts,
    this.deliveriesThisWeek,
    this.totalDeliveries,
  }) {}
}
