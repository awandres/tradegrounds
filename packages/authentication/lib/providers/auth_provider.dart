import 'package:flutter/material.dart';
import 'package:authentication/models/validation_item.dart';

class AuthProvider with ChangeNotifier {
  ValidationItem _storeName = ValidationItem(null, null);
  ValidationItem _userEmail = ValidationItem(null, null);
  ValidationItem _userPassword = ValidationItem(null, null);
  int _authStep = 1;
  bool _termsAgreed = false;
  bool _termsValid = true;
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // bool isValid = false;
  var isValid;

//Getters
  ValidationItem get storeName => _storeName;
  ValidationItem get userEmail => _userEmail;
  ValidationItem get userPassword => _userPassword;
  bool get termsAgreed => _termsAgreed;
  bool get termsValid => _termsValid;
  GlobalKey get formKey => _formKey;

  int get authStep => _authStep;

//Setters

  void handleAuthStep() {
    var isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
      if (_authStep == 3) {
        submitData();
      } else {
        _authStep = _authStep + 1;
      }
      print('auth step is $authStep');

      notifyListeners();
    }
  }

  void handleBack() {
    _authStep = _authStep - 1;
    print('auth step is $authStep');
    notifyListeners();
  }

  void changeStoreName(String value) {
    if (value.length > 0) {
      _storeName = ValidationItem(value, null);
    } else {
      _storeName =
          ValidationItem(null, "Please enter a name for your business");
    }
    notifyListeners();
  }

  void changeUserEmail(String value) {
    if (value.length >= 3 && value.contains('@')) {
      _userEmail = ValidationItem(value, null);
    } else {
      _userEmail = ValidationItem(null, "Please Enter a Valid Email Address");
    }
    notifyListeners();
  }

  void changeUserPassword(String value) {
    if (value.length >= 7) {
      _userPassword = ValidationItem(value, null);
    } else {
      _userPassword = ValidationItem(null, "Must be at least 7 characters");
    }
    notifyListeners();
  }

  void changeTermsAgreed(bool value) {
    _termsAgreed = value;
    _termsValid = value;
    print('changing termsagreed to $_termsAgreed');
    print('termsValid is $_termsValid');
    notifyListeners();
  }

  void submitData() {
    if (!_termsAgreed) {
      print('terms agreed is required');
      _termsValid = false;
      notifyListeners();

      return;
    }
    ;
    // THIS IS WHERE FIREBASE AUTH WOULD OCCUR

    print(
        "StoreName: ${storeName.value}, UserEmail: ${userEmail.value}, User Password: ${userPassword.value} terms agreed is $termsAgreed");
    _authStep = 1;
    print('you are now logged in');
    notifyListeners();
  }
}
