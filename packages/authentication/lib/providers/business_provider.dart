import 'package:flutter/material.dart';

import 'package:authentication/models/business_location.dart';

class BusinessProvider with ChangeNotifier {
  BusinessLocation _businessLocation = BusinessLocation(
    null,
    null,
    null,
    null,
    null,
  );

// Business Location Setters
  void setBusinessStreetAddress(value) {
    _businessLocation.streetAddress = value;
  }

  void setBusinessAddressUnit(value) {
    _businessLocation.unit = value;
  }

  void setBusinessCity(value) {
    _businessLocation.city = value;
  }

  void setBusinessState(value) {
    _businessLocation.state = value;
  }

  void setBusinessZip(value) {
    _businessLocation.zip = value;
  }

  // TODO: Set relevant business properties in one function

  // void setBusinessLocation(streetAddress, unit, city, state, zip) {
  //   _businessLocation.streetAddress = streetAddress;
  //   _businessLocation.unit = unit;
  //   _businessLocation.city = city;
  //   _businessLocation.state = state;
  //   _businessLocation.zip = zip;
  //   print(
  //       'business info is $_businessLocation street address: ${_businessLocation.streetAddress} , unit ${_businessLocation.unit}, city: ${_businessLocation.city} state: ${_businessLocation.state}, zip: ${_businessLocation.zip}');
  //   notifyListeners();
  // }
}
