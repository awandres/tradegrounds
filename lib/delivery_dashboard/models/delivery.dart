import 'package:latlng/latlng.dart';
import '../../product_center/models/product.dart';

class Delivery {
  var items = new List<Product>();
  String courier;
  String recipient;
  String cost;
  String pickup;
  String dropoff;
  LatLng current_location;
  DateTime created_at;
  DateTime updated_at;
  String estimatedDeliveryTime;
  String deliveredAtTime;
  int itemCount;
  bool fulfilled;
  int window;

  Delivery(
      {this.items,
      this.recipient,
      this.cost,
      this.pickup,
      this.dropoff,
      this.window,
      this.current_location,
      this.fulfilled = false,
      this.estimatedDeliveryTime,
      this.deliveredAtTime,
      this.itemCount,
      this.courier}) {
    // this.courier = null;
    this.created_at = DateTime.now();
    // this.fulfilled = false;
  }

  LatLng getLocation() {
    return this.current_location;
  }

  int getItemsCount() {
    return items.length;
  }
}
