import 'package:latlng/latlng.dart';

class Product {
  String name;
  String cost;
}

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
  bool fulfilled;
  int window;

  Delivery({
    this.items,
    this.recipient,
    this.cost,
    this.pickup,
    this.dropoff,
    this.window,
    this.current_location,
    this.fulfilled = false,
  }) {
    this.courier = null;
    this.created_at = DateTime.now();
    this.fulfilled = false;
  }

  LatLng getLocation() {
    return this.current_location;
  }

  int getItemsCount() {
    return items.length;
  }
}
