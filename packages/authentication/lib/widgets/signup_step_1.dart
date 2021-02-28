import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authentication/providers/auth_provider.dart';
import 'package:authentication/widgets/auth_form_field.dart';

class SignupStep1 extends StatefulWidget {
  @override
  _SignupStep1State createState() => _SignupStep1State();
}

class _SignupStep1State extends State<SignupStep1> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context);
    return Column(
      children: [
        AuthFormField(
          valueKey: 'email',
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
          actionKeyboard: TextInputAction.next,
          onSavedFunction: (String value) {
            authService.changeUserEmail(value);
          },
          validatorFunction: emailValidation,
          validatorErrorMessage: 'Please enter a valid email',
        ),
        SizedBox(
          height: 10,
        ),
        AuthFormField(
          valueKey: 'password',
          labelText: 'Password',
          obscureText: true,
          actionKeyboard: TextInputAction.next,
          onSavedFunction: (String value) {
            authService.changeUserPassword(value);
          },
          validatorFunction: passwordValidator,
          validatorErrorMessage: 'Please enter a password',
          onChangedFunction: (String value) {
            authService.changeUserPassword(value);
          },
        ),
        SizedBox(
          height: 10,
        ),
        AuthFormField(
          valueKey: 'passwordConfirm',
          labelText: 'Confirm Password',
          obscureText: true,
          actionKeyboard: TextInputAction.go,
          validatorFunction: passwordMatchValidator,
          validatorErrorMessage: 'Passwords do not match',
        ),
        FlatButton(
          textColor: Theme.of(context).primaryColor,
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
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
      ],
    );
  }
}
