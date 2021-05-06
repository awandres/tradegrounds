import 'package:latlng/latlng.dart';
import 'package:flutter/foundation.dart';

class Product {
  String name;
  String cost;
  String dimensions;
  String weight;
  String sku;
  // set to false on instantiation
  bool ageVerified;
  int amountInsured;
  bool insured;
  bool signatureNeeded;

  bool active;
  double deliveryCost;
  int amountDelivered;

  Product ({
    @required this.name,
    @required this.cost,
    @required this.sku,
    @required this.amountInsured,
    @required this.amountDelivered,
    @required this.deliveryCost,

    this.ageVerified =false,
    this.insured=false,
    this.signatureNeeded=false,
    this.active=false,
    

  });

  void toggleAgeVerified(){
    ageVerified= !this.ageVerified;
  }

  void toggleInsurance(){
    insured= !this.insured;
  }

  void toggleSignature(){
    signatureNeeded= !this.signatureNeeded;
  }

  void setName(value){
    name=value;
    print(name);
  }

  void setCost(value){
    cost=value;
    print(cost);
  }

  void setDimensions(value){
    dimensions=value;
    print(dimensions);
  }

  void setWeight(value){
    weight=value;
    print(weight);
  }

  void setSku(value){
    sku=value;
    print(sku);
  }
}
