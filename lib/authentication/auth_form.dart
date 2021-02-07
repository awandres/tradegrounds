import 'package:flutter/material.dart';
import 'package:storegrounds/settings/terms.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String storeName,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  ScrollController _scrollController = ScrollController();

  bool termsAgreed = false;
  final _formKey = GlobalKey<FormState>();
  var _isLogin = false;
  int _authStep = 0;
  int _value = 15;
  String _userEmail = '';
  String _storeName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          padding: EdgeInsets.only(
              bottom: 10, left: 40, right: 40, top: (deviceSize.height * 0.05)),
          child: LayoutBuilder(builder: (ctx, constraints) {
            return Column(
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
                if (_authStep == 0)
                  Flexible(
                    child: Container(
                      height: constraints.maxHeight * 0.3,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/storegrounds_swoop.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                Flexible(
                  flex: deviceSize.width > 600 ? 2 : 1,
                  child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            if (_authStep >= 1)
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
                                      }),
                                ],
                              ),
                            if (_authStep == 0)
                              TextFormField(
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      labelText: 'Business Name',
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(20.0),
                                        ),
                                      )),
                                  key: ValueKey('storename'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a store name';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (value) {
                                    _storeName = value;
                                  }),
                            SizedBox(
                              height: 10,
                            ),
                            if (_authStep == 0)
                              TextFormField(
                                  key: ValueKey('email'),
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      labelText: 'Email',
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(20.0),
                                        ),
                                      )),
                                  validator: (value) {
                                    if (value.isEmpty || !value.contains('@')) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (value) {
                                    _userEmail = value;
                                  }),
                            SizedBox(
                              height: 10,
                            ),
                            if (_authStep == 0)
                              TextFormField(
                                  key: ValueKey('password'),
                                  validator: (value) {
                                    if (value.isEmpty || value.length < 7) {
                                      return 'Password must be at least 7 characters long.';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      labelText: 'Password',
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(20.0),
                                        ),
                                      )),
                                  obscureText: true,
                                  onSaved: (value) {
                                    _userPassword = value;
                                  }),
                            SizedBox(
                              height: 10,
                            ),
                            if (_authStep == 0)
                              TextFormField(
                                key: ValueKey('passwordConfirm'),
                                validator: (value) {
                                  if (value.isEmpty ||
                                      value.length != _userPassword.length ||
                                      value != _userPassword) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    isDense: true,
                                    labelText: 'Confirm Password',
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(20.0),
                                      ),
                                    )),
                                obscureText: true,
                                onSaved: (value) {},
                              ),
                            if (!widget.isLoading && _authStep == 0)
                              FlatButton(
                                  textColor: Theme.of(context).primaryColor,
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'Login? ',
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Click Here',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.blue,
                                            )),
                                      ],
                                    ),
                                  )),
                            if (_authStep == 1)
                              SizedBox(
                                width: deviceSize.width,
                                height: 300.0,
                                child: const Card(child: Text('Map Here')),
                              ),
                            if (_authStep == 1)
                              Column(
                                children: [
                                  Text('Set a Delivery Radius',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  Slider(
                                    value: 5.5,
                                    min: 1.0,
                                    max: 10.0,
                                    activeColor: Colors.blue,
                                    inactiveColor: Colors.black,
                                    label: 'Set a radius',
                                    onChanged: (double newValue) {
                                      setState(() {
                                        newValue = newValue + 2;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            if (_authStep == 2)
                              SingleChildScrollView(
                                controller: _scrollController,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: (deviceSize.height * 0.5),
                                  ),
                                  child: ListView(
                                      controller: _scrollController,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Container(
                                              // A fixed-height child.
                                              alignment: Alignment.center,
                                              child: Text('Terms & Agreements'),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              child: Text(termsText),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ]),
                                ),
                              ),
                            if (_authStep == 2)
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
                                  textColor: Theme.of(context)
                                      .primaryTextTheme
                                      .button
                                      .color,
                                  child:
                                      Text(_authStep == 1 ? 'Next' : 'Sign Up'),
                                  onPressed: () {
                                    setState(() {
                                      if (_authStep == 2) {
                                        _authStep = 0;
                                      } else {
                                        _authStep = _authStep + 1;
                                      }
                                      print(_authStep);
                                    });
                                  }),
                          ])),
                ),
              ],
            );
          }),
        ),
      ),
    );
    ;
  }
}
