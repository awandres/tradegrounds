import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authentication/providers/auth_provider.dart';
import 'package:authentication/widgets/signup_step_1.dart';
import 'package:authentication/widgets/signup_step_2.dart';
import 'package:authentication/widgets/signup_step_3.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();
    final deviceSize = MediaQuery.of(context).size;

    final authService = Provider.of<AuthProvider>(context);
    int signupStep = authService.signupStep;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          padding: EdgeInsets.only(
              bottom: 0, left: 40, right: 40, top: (deviceSize.height * 0.05)),
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      'Storegrounds',
                      style: Theme.of(context).textTheme.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (signupStep == 1)
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
                      key: authService.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            if (signupStep >= 2)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FlatButton(
                                    child: Text('< Back'),
                                    textColor: Colors.grey,
                                    onPressed: authService.handleBack,
                                  ),
                                ],
                              ),
                            if (signupStep == 1) SignupStep1(),
                            if (signupStep == 1)
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
                            if (signupStep == 2) SignupStep2(),
                            if (signupStep == 3) SignupStep3(),
                            if (signupStep == 3)
                              SizedBox(height: 20)
                            else
                              SizedBox(height: 0),
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
                              child: Text((signupStep == 2)
                                  ? 'Next'
                                  : (signupStep == 3)
                                      ? 'Submit'
                                      : 'Sign Up'),
                              onPressed: (signupStep < 3)
                                  ? authService.handleAuthStep
                                  : authService.submitData,
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
    );
  }
}
