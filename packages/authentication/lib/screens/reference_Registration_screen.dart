import 'package:flutter/material.dart';
import 'package:authentication/widgets/reference_auth_form.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // final _auth = FirebaseAuth.instance;
  final authStep = 1;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    // AuthResult authResult;
    print('inside submit form now');

    try {
      // setState(() {
      //   // _isLoading = true;
      // });
      // if (isLogin) {
      //   authResult = await _auth.signInWithEmailAndPassword(
      //       email: email, password: password);
      // } else {
      //   authResult = await _auth.createUserWithEmailAndPassword(
      //       email: email, password: password);
      //   await Firestore.instance
      //       .collection('users')
      //       .document(authResult.user.uid)
      //       .setData({
      //     'username': username,
      //     'email': email,
      //   });
      // }
      print('okay form submitting');
    } on PlatformException catch (err) {
      var message = 'An error occurred.';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ));
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext ctx) {
    print(authStep);
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          padding: EdgeInsets.only(
              bottom: 10, left: 40, right: 40, top: (deviceSize.height * 0.10)),
          child: AuthForm(
            _submitAuthForm,
            _isLoading,
          ),
        ),
      ),
    );
  }
}
