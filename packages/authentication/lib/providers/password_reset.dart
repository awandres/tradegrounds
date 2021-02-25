import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';

class PasswordReset with ChangeNotifier {
  String userEmail;
  String newPassword;
  String resetCode;

  // PasswordReset({
  //   this.email = null,
  //   this.newPassword = null,
  //   this.resetCode = null
  // });

  // This function submits a post a request to Firebase auth REST API 
  // which fires password change email if the email exists
  Future<void> sendPasswordResetEmail(userEmail) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyC660Vapg-RuuZESWdWmMwOoj49mTH_mUM';
    try {
      final response = await http.post(
        url,
        body:
            json.encode({"requestType": "PASSWORD_RESET", "email": userEmail}),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      print(responseData);
    } catch (error) {
      throw error;
    }
  }

  // Once user recieves an email with a on time password reset code
  // this function will be called from resetCode widget
  // once the user enters the reset code this function will be triggerd on submit
  // post request made to FirebaseAuth Api to verify the reset code
  Future<void> confirmPasswordResetCode(resetCode) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:resetPassword?key=AIzaSyDsqdfnET4_5_-cuzOaHQkSTsrRELdjYxI';
    try {
      final response = await http.post(
        url,
        body: json.encode({"oobCode": resetCode}),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      print(responseData);
    } catch (error) {
      throw error;
    }
  }


  // the reset code which is saved along with the entered new password, 
  // a post request will be made to change password. 
  // this is the final step
  Future<void> passwordResetConfirm(newPassword) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:resetPassword?key=AIzaSyDsqdfnET4_5_-cuzOaHQkSTsrRELdjYxI';
    try {
      final response = await http.post(
        url,
        body: json.encode({"oobCode": resetCode, "newPassword": newPassword}),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      print(responseData);
    } catch (error) {
      throw error;
    }
  }
}
