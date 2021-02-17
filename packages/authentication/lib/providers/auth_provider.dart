import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:authentication/models/http_exception.dart';
import 'package:authentication/models/validation_item.dart';

class AuthProvider with ChangeNotifier {
  // Form
  ValidationItem _storeName = ValidationItem(null, null);
  ValidationItem _userEmail = ValidationItem(null, null);
  ValidationItem _userPassword = ValidationItem(null, null);
  int _signupStep = 1;
  bool _termsAgreed = false;
  bool _termsValid = true;
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // bool isValid = false;
  var isValid;

  // Firebase
  String _token;
  DateTime _expiryDate;
  String _userId;

//Getters
// Form
  ValidationItem get storeName => _storeName;
  ValidationItem get userEmail => _userEmail;
  ValidationItem get userPassword => _userPassword;
  bool get termsAgreed => _termsAgreed;
  bool get termsValid => _termsValid;
  GlobalKey get formKey => _formKey;
  int get signupStep => _signupStep;

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

  void handleAuthStep() {
    var isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
      if (_signupStep == 3) {
        submitData();
      } else {
        _signupStep = _signupStep + 1;
      }
      print('auth step is $signupStep');

      notifyListeners();
    }
  }

  void handleBack() {
    _signupStep = _signupStep - 1;
    print('auth step is $signupStep');
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

  // Firebase API Logic

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/$urlSegment?AIzaSyDsqdfnET4_5_-cuzOaHQkSTsrRELdjYxI';

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

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'accounts:signInWithPassword');
  }

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

  void submitData() async {
    if (!_termsAgreed) {
      print('terms agreed is required');
      _termsValid = false;
      notifyListeners();
      return;
    }
    // THIS IS WHERE FIREBASE AUTH WOULD OCCUR
    print(
        "StoreName: ${storeName.value}, UserEmail: ${userEmail.value}, User Password: ${userPassword.value} terms agreed is $termsAgreed");

    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    // REMOVING LOADING FUNCTIONALITY UNTIL AUTH TESTING
    // setState(() {
    //   _isLoading = true;
    // });

    try {
      await signup(
        userEmail.value,
        userPassword.value,
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address exists';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      }

      // NEED TO FIGURE OUT HOW ERROR DIALOG WILL BE PASSED TO CONTEXT

      //   _showErrorDialog(errorMessage);
      // } catch (error) {
      //   var errorMessage = 'Coul not authenticate you. Please try again later.';
      //   _showErrorDialog(errorMessage);
      // }

// REMOVING LOADING FUNCTIONALITY UNTIL AUTH TESTING
      // setState(() {
      //   _isLoading = false;
      // });
      _signupStep = 1;
      print('you are now logged in');
      notifyListeners();
    }
  }
}
