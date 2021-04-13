import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';
import './password_reset_screen.dart';
import '../widgets/dialog_box.dart';
import '../screens/signup_screen.dart';
import 'package:flutter/services.dart';
import 'package:authentication/widgets/ CoreWidgets/auth_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//will try to redo this-- need to enact a link URI
// const _tradegroundsurl = 'https://tradegrounds.info';

class _LoginScreenState extends State<LoginScreen> {
  // ---------------------------------------------------------------------
  // -------Statefull widget that Handles Login Screen functionality 
  // ---------------------------------------------------------------------
  final GlobalKey<FormState> _loginKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  // ----------------------------------------------------------------------
  // ------- This is where error dialog pops on un successfull login
  // ----------------------------------------------------------------------
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      // custom dialog box box
      builder: (ctx) => CustomDialogBox(
          title: 'Uh Oh!',
          errorMsg: message,
          btnText: 'back',
        )
      );
  }

  // ----------------------------------------------------------------------
  // --- Submit Function is defined below which returns a future 
  // ----------------------------------------------------------------------
  Future<void> _submit() async {
    if (!_loginKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _loginKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      // Sign user up
      await Provider.of<Auth>(context, listen: false).login(
        _authData['email'],
        _authData['password'],
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Email or password is incorrect.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Email or password is incorrect.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final isTablet = deviceSize.width > 750 ? true : false;
    final isPhone = deviceSize.width < 490 ? true : false;

    return Scaffold(
  // ---------------------------------------------------------------
  // --- Body begins here. Wrapped in a single child scroll view
  // ---------------------------------------------------------------
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: isTablet ? deviceSize.height * 0.9 : deviceSize.height,
            width: isTablet ? deviceSize.width * 0.9 : deviceSize.width,
            padding: EdgeInsets.only(
                bottom: 10,
                left: 40,
                right: 40,
                top: (deviceSize.height * 0.10)),
      // ------------------------------------------------------------------------------
      // --------- Layout builder passes down constraints to child widgets here
      // ------------------------------------------------------------------------------
            child: LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // -----------
                  // --- Logo
                  // -----------
                  Material(
                    elevation: 5.0,
                    shadowColor: Colors.blueGrey,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(60.0)),
                    child: Container(
                      height: constraints.maxHeight * 0.35,
                      width: constraints.maxWidth * 0.60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        child: Image.asset(
                          'assets/images/storegroundsLogo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // -------------
                  //  --- Title
                  // -------------
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          'Storegrounds',
                          style: Theme.of(context).textTheme.title,
                        ),
                      )),
          // ---------------------------------------------------
          // ---- Container that wraps custom Auth Form fields
          // --------------------------------------------------
                  Container(
                    height: constraints.maxHeight * 0.40,
                    width: constraints.maxWidth * 0.7,
                    child: Form(
                      key: _loginKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                          // ----------------
                          // -- Email Input
                          // ----------------
                            AuthFormField(
                                valueKey: 'email',
                                labelText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                onSavedFunction: (String value) {
                                  _authData['email'] = value;
                                },
                                validatorFunction: emailValidation,
                                validatorErrorMessage:
                                    'Please enter a valid email',
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          // ----------------
                          // -- Password
                          // ----------------
                            AuthFormField(
                              valueKey: 'password',
                              labelText: 'Password',
                              obscureText: true,
                              validatorFunction: passwordValidator,
                              validatorErrorMessage: 'Please enter a password',
                              passwordVisibilityToggle: true,
                              onSavedFunction: (String value) {
                                _authData['password'] = value;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          // -----------------------------------------------------------
                          // ---  Route to Register screen
                          // -----------------------------------------------------------
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: FlatButton(
                                textColor: Theme.of(context).primaryColor,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Signup()));
                                },
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      fontSize: 20.0,
                                    ),
                                    text: 'New User? ',
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Click Here',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // -----------------------------------------
                            // Conditionally rendering loading spinner
                            // -----------------------------------------
                            if (_isLoading)
                              CircularProgressIndicator()
                            else
                            // ------------------------
                            // ----- Login Button
                            // ------------------------
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0.0),
                                child: RaisedButton(
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      letterSpacing: 7.5,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    _submit();
                                    HapticFeedback.mediumImpact();
                                  },
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100.0, vertical: 25.0),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Theme.of(context)
                                      .primaryTextTheme
                                      .button
                                      .color,
                                ),
                              ),
                            SizedBox(
                              height: 20,
                            ),
                            // ----------------------------------------------
                            // ----- Route to Forgot Password (Button)
                            // ----------------------------------------------
                            FlatButton(
                              child: const Text(
                                'Forgot your Password ?',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        PasswordResetScreen()));
                              },
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 4),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              textColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // ---------------------------------------
                  // -------------- Footer
                  // ---------------------------------------
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: constraints.maxHeight * 0.07,
                      width: deviceSize.width,
                      // color: Colors.black,
                      // padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/tradegroundsIg.png',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Tradegrounds Inc. 2021',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                                Text(
                                  'www.tradegrounds.info',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'v.0.0.1',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
