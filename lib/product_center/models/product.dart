import 'package:latlng/latlng.dart';
import 'package:flutter/foundation.dart';

class Product {
  String name;
  String cost;
  String dimensions;
  String weight;
  String sku;
  String imageUrl;
  // set to false on instantiation
  bool ageVerified;
  int amountInsured;
  bool insured;
  bool signatureNeeded;

  bool active;
  double deliveryCost;
  int amountDelivered;

  Product({
    // @required this.productUrl,
    @required this.name,
    @required this.cost,
    @required this.sku,
    @required this.amountInsured,
    @required this.amountDelivered,
    @required this.deliveryCost,
    @required this.imageUrl,
    this.ageVerified = false,
    this.insured = false,
    this.signatureNeeded = false,
    this.active = false,
  });

  void toggleAgeVerified() {
    ageVerified = !this.ageVerified;
  }

  void toggleInsurance() {
    insured = !this.insured;
  }

  void toggleSignature() {
    signatureNeeded = !this.signatureNeeded;
  }

  void setName(value) {
    name = value;
  }

  void setCost(value) {
    cost = value;
  }

  void setDimensions(value) {
    dimensions = value;
  }

  void setWeight(value) {
    weight = value;
  }

  void setSku(value) {
    sku = value;
  }
}
