import 'package:flutter/material.dart';
import 'auth_step_1.dart';
import 'auth_step_2.dart';
import 'auth_step_3.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
    String _userEmail,
    String _storeName,
    String _userPassword,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool termsValid = true;
  bool termsAgreed = false;
  final _formKey = GlobalKey<FormState>();
  var _isLogin = false;
  int _authStep = 1;
  String _userEmail = '';
  String _storeName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    // print('terms agreed is $termsAgreed');
    print('Auth step is $_authStep');

    // if (_authStep == 3 && !termsAgreed) {
    //   setState(() => termsValid = termsAgreed);
    //   return;
    // }

    if (isValid) {
      setState(() {
        if (_authStep == 3) {
          _authStep = 1;
        } else {
          _authStep = _authStep + 1;
        }
      });

      _formKey.currentState.save();
      if (_authStep == 3)
        widget.submitFn(
          _userEmail.trim(),
          _userPassword.trim(),
          _storeName.trim(),
          _isLogin,
          context,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: deviceSize.width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 195, 1, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  'Storegrounds',
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
              ),
              if (_authStep == 1)
                Container(
                    height: constraints.maxHeight * 0.3,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/storegrounds_swoop.png',
                      fit: BoxFit.contain,
                    ),
                ),
              Container(
                height: constraints.maxHeight *0.5,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          if (_authStep >= 2)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  child: Text('< Back'),
                                  textColor: Colors.grey,
                                  onPressed: () {
                                    setState(() {
                                      _authStep = _authStep - 1;
                                      print(_authStep);
                                    });
                                  },
                                ),
                              ],
                            ),
                          if (_authStep == 1) AuthStep1(),
                          if (!widget.isLoading && _authStep == 1)
                            FlatButton(
                              textColor: Theme.of(context).primaryColor,
                              child: Text.rich(
                                TextSpan(
                                  text: 'Login? ',
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Click Here',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (_authStep == 2) AuthStep2(),
                          if (_authStep == 3) AuthStep3(),
                          if (_authStep == 3)
                            SizedBox(height: 20)
                          else
                            SizedBox(height: 0),
                          if (widget.isLoading) CircularProgressIndicator(),
                          if (!widget.isLoading)
                            RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 8.0),
                                color: Theme.of(context).primaryColor,
                                textColor:
                                    Theme.of(context).primaryTextTheme.button.color,
                                child: Text((_authStep == 2)
                                    ? 'Next'
                                    : (_authStep == 3)
                                        ? 'Submit'
                                        : 'Sign Up'),
                                onPressed: _trySubmit),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
