import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:authentication/models/http_exception.dart';
import 'package:authentication/models/validation_item.dart';
import 'package:authentication/models/user_data.dart';
import 'package:authentication/models/business_location.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupProvider with ChangeNotifier {
  UserData _userData = UserData(
    null,
    null,
    null,
    null,
    null,
  );

  BusinessLocation _businessLocation = BusinessLocation(
    null,
    null,
    null,
    null,
    null,
  );

  //Getters
  String get storeName => _userData.storeName;
  String get userEmail => _userData.userEmail;
  String get userPassword => _userData.userPassword;
  String get businessCategory => _userData.businessCategory;
  String get phoneNumber => _userData.phoneNumber;

  String get streetAddress => _businessLocation.streetAddress;
  String get unit => _businessLocation.unit;
  String get city => _businessLocation.city;
  String get state => _businessLocation.state;
  String get zip => _businessLocation.zip;

// Form

  bool get termsAgreed => _termsAgreed;
  bool get emailExists => _emailExists;
  bool get accountCreated => _accountCreated;

  bool get termsValid => _termsValid;
  bool get isLoading => _isLoading;
  GlobalKey get signupKey => _signupKey;
  int get signupStep => _signupStep;
  int _signupStep = 1;
  bool _termsAgreed = false;
  bool _termsValid = true;
  bool _isLoading = false;
  bool _emailExists = false;
  bool _accountCreated = false;

  static GlobalKey<FormState> _signupKey = new GlobalKey<FormState>();
  // bool isValid = false;
  var isValid;

  // Firebase
  String _token;
  DateTime _expiryDate;
  String _userId;
  final _auth = FirebaseAuth.instance;

//Getters
// TEST CODE FOR DYNAMIC AUTH GOES HERE

// Firebase
  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }
//Setters

//Form Logic

  Future checkIfEmailExists() async {
    print('running email check');
    var authResult = await _auth.fetchSignInMethodsForEmail(email: userEmail);
    if (authResult.length == 1) toggleEmailExists();
    notifyListeners();
    toggleLoading();
    return;
  }

  void handleSignupStep() async {
    var isValid = _signupKey.currentState.validate();

    if (isValid) {
      _signupKey.currentState.save();

      if (_signupStep == 1) {
        toggleLoading();
        await checkIfEmailExists();
      }
      if (_signupStep == 4) {
        submitData();
      } else if (!_emailExists) {
        ++_signupStep;
      }
      print('auth step is $signupStep');

      notifyListeners();
    }
  }

  void resetSignupStep() {
    _signupStep = 1;
    notifyListeners();
  }

  void handleBack() {
    _signupStep = _signupStep - 1;
    print('auth step is $signupStep');
    notifyListeners();
  }

// UserData Setters

  void changeStoreName(String value) {
    if (value.length > 0) {
      _userData.storeName = value;
    }
    notifyListeners();
  }

  void changeUserEmail(String value) {
    if (value.length >= 3 && value.contains('@')) {
      _userData.userEmail = value;
    }
    notifyListeners();
  }

  void changeUserPassword(String value) {
    if (value.length >= 7) {
      _userData.userPassword = value;
    }
    notifyListeners();
  }

  void changeBusinessCategory(String value) {
    _userData.businessCategory = value;
    notifyListeners();
  }

  void changeBusinessPhoneNumber(String value) {
    print('changing phone');
    _userData.phoneNumber = value;
    notifyListeners();
  }

  void toggleAccountCreated() {
    _accountCreated = !_accountCreated;
    notifyListeners();
  }

// Business Location Setters
  void setBusinessStreetAddress(value) {
    _businessLocation.streetAddress = value;
    notifyListeners();
  }

  void setBusinessAddressUnit(value) {
    _businessLocation.unit = value;
    notifyListeners();
  }

  void setBusinessCity(value) {
    _businessLocation.city = value;
    notifyListeners();
  }

  void setBusinessState(value) {
    _businessLocation.state = value;
    notifyListeners();
  }

  void setBusinessZip(value) {
    _businessLocation.zip = value;
    notifyListeners();
  }

  void changeTermsAgreed(bool value) {
    _termsAgreed = value;
    _termsValid = value;
    print('changing termsagreed to $_termsAgreed');
    print('termsValid is $_termsValid');
    notifyListeners();
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void toggleEmailExists() {
    _emailExists = !_emailExists;
    _signupStep = 1;
    notifyListeners();
  }

  // Firebase API Logic

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/$urlSegment?key=AIzaSyDsqdfnET4_5_-cuzOaHQkSTsrRELdjYxI';

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      print('$responseData');

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'accounts:signUp');
  }

  void submitData() async {
    AuthResult authResult;

    if (!_termsAgreed) {
      print('terms agreed is required');
      _termsValid = false;
      notifyListeners();
      return;
    }
    print(
        'User Data is ${_userData.userEmail}, ${_userData.userPassword}, ${_userData.storeName}, ${_userData.businessCategory} phone number: ${_userData.phoneNumber}');
    print(
        'business info is $_businessLocation street address: ${_businessLocation.streetAddress} , unit ${_businessLocation.unit}, city: ${_businessLocation.city} state: ${_businessLocation.state}, zip: ${_businessLocation.zip}');

    if (!_signupKey.currentState.validate()) {
      return;
    }

    _signupKey.currentState.save();
    toggleLoading();

    try {
      // await signup(
      //   userEmail.trim(),
      //   userPassword.trim(),
      // );
      authResult = await _auth.createUserWithEmailAndPassword(
          email: userEmail.trim(), password: userPassword.trim());
      await Firestore.instance
          .collection('businesses')
          .document(authResult.user.uid)
          .setData({
        'address': {
          'streetAddress': _businessLocation.streetAddress,
          'unit': _businessLocation.unit,
          'city': _businessLocation.city,
          'state': _businessLocation.state,
          'zip': _businessLocation.zip,
        },
        'storename': _userData.storeName,
        'category': _userData.businessCategory,
        'phoneNumber': _userData.phoneNumber,
      });
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address exists';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      }
    }

    toggleAccountCreated();
    toggleLoading();

    // _signupStep = 1;
    print('you are now logged in');
    notifyListeners();
  }
}

// TEST CODE FOR DYNAMIC AUTH

// ValidationItem _storeName = ValidationItem(null, null);
// ValidationItem _userEmail = ValidationItem(null, null);
// ValidationItem _userPassword = ValidationItem(null, null);
// ValidationItem get storeName => _storeName;
// ValidationItem get userEmail => _userEmail;
// ValidationItem get userPassword => _userPassword;
// ValidationItem get storeName => _storeName;
// ValidationItem get userEmail => _userEmail;
// ValidationItem get userPassword => _userPassword;

// NEED TO FIGURE OUT HOW ERROR DIALOG WILL BE PASSED TO CONTEXT

//   _showErrorDialog(errorMessage);
// } catch (error) {
//   var errorMessage = 'Coul not authenticate you. Please try again later.';
//   _showErrorDialog(errorMessage);
// }

// NEED TO FIGURE OUT HOW ERROR DIALOG WILL BE PASSED TO CONTEXT

//   void _showErrorDialog(String message) {
//   showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//               title: Text('An Error Occured'),
//               content: Text(message),
//               actions: <Widget>[
//                 FlatButton(
//                   child: Text('Okay'),
//                   onPressed: () {
//                     Navigator.of(ctx).pop();
//                   },
//                 )
//               ]));
// }
