import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authentication/providers/signup_provider.dart';
import 'package:authentication/screens/login_screen.dart';

import 'package:authentication/widgets/FunctionalWidgets/signup_step_1.dart';
import 'package:authentication/widgets/FunctionalWidgets/signup_step_2.dart';
import 'package:authentication/widgets/FunctionalWidgets/signup_step_3.dart';
import 'package:authentication/widgets/FunctionalWidgets/signup_step_4.dart';
import '../widgets/dialog_box.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    // final _signupKey = GlobalKey<FormState>();
    final deviceSize = MediaQuery.of(context).size;
    final isTablet = deviceSize.width > 750 ? true : false;
    final isPhone = deviceSize.width < 490 ? true : false;

    final signupService = Provider.of<SignupProvider>(context);
    int signupStep = signupService.signupStep;

    void _showErrorDialog(String message) {
      showDialog(
          context: context,
          builder: (ctx) => CustomDialogBox(
                title: 'Uh Oh!',
                errorMsg: message,
                btnText: 'back',
              ));
    }

    if (signupService.accountCreated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
        signupService.toggleAccountCreated();
        signupService.resetSignupStep();
      });
    }

    if (signupService.emailExists) {
      Future.delayed(Duration.zero, () async {
        signupService.toggleEmailExists();
        _showErrorDialog('Email address is already in use');
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: isTablet ? EdgeInsets.only(top: 0) : null,
            child: Container(
              height: isTablet ? deviceSize.height * 0.9 : deviceSize.height,
              width: isTablet ? deviceSize.width * 0.69 : deviceSize.width,
              padding: EdgeInsets.only(
                  bottom: 10,
                  left: 40,
                  right: 40,
                  top: (deviceSize.height * 0.10)),
              child: LayoutBuilder(
                builder: (ctx, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: deviceSize.width,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 195, 1, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Storegrounds',
                            style: Theme.of(context).textTheme.title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      if (signupStep == 1)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Container(
                            height: constraints.maxHeight * 0.28,
                            width: constraints.maxHeight * 0.5,
                            child: Image.asset(
                              'assets/images/storegrounds_swoop.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      Flexible(
                        flex: 5,
                        child: Form(
                          key: signupService.signupKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                if (signupStep >= 3 && signupStep < 4)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlatButton(
                                        child: Text(
                                          '< Back',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                        textColor: Colors.grey,
                                        onPressed: signupService.handleBack,
                                      ),
                                    ],
                                  ),
                                if (signupStep == 1) SignupStep1(),
                                if (signupStep == 2) SignupStep2(),
                                if (signupStep == 3) SignupStep3(),
                                if (signupStep == 4) SignupStep4(),
                                if (signupStep == 4)
                                  SizedBox(height: 20)
                                else
                                  SizedBox(height: 0),
                                if (signupService.isLoading)
                                  CircularProgressIndicator(),
                                if (!signupService.isLoading)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: RaisedButton(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80.0, vertical: 28.0),
                                      color: Theme.of(context).primaryColor,
                                      textColor: Theme.of(context)
                                          .primaryTextTheme
                                          .button
                                          .color,
                                      child: Text(
                                        (signupStep > 1 && signupStep < 4)
                                            ? 'Next'
                                            : (signupStep == 4)
                                                ? 'Submit'
                                                : 'SIGN UP',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          letterSpacing: 7.5,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: (signupStep < 4)
                                          ? signupService.handleSignupStep
                                          : signupService.submitData,
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
