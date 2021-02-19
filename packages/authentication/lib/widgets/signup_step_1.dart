import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authentication/providers/auth_provider.dart';

class SignupStep1 extends StatefulWidget {
  @override
  _SignupStep1State createState() => _SignupStep1State();
}

class _SignupStep1State extends State<SignupStep1> {
  var _passwordToMatch;
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context);
    print('signupStep is ${authService.signupStep} at step 1');
    return Column(children: [
      TextFormField(
        decoration: InputDecoration(
          isDense: true,
          labelText: "Business Name",
          // errorText: authService.storeName.error,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        key: ValueKey('storename'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a store name';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        // onChanged: (String value) {
        //   authService.changeStoreName(value);
        // },
        onSaved: (String value) {
          authService.changeStoreName(value);
        },
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        decoration: InputDecoration(
          isDense: true,
          labelText: "Email",
          // errorText: authService.userEmail.error,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        key: ValueKey('email'),
        validator: (value) {
          if (value.isEmpty || !value.contains('@')) {
            return 'Please enter an email';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        // onChanged: (String value) {
        //   authService.changeUserEmail(value);
        // },
        onSaved: (String value) {
          authService.changeUserEmail(value);
        },
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        key: ValueKey('password'),
        decoration: InputDecoration(
          isDense: true,
          // errorText: authService.userPassword.error,
          labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        obscureText: true,
        validator: (value) {
          _passwordToMatch = value;
          if (value.isEmpty || value.length < 7) {
            return 'Password must be at least 7 characters long.';
          }
          return null;
        },
        onChanged: (String value) {
          authService.changeUserPassword(value);
        },
        onSaved: (String value) {
          authService.changeUserPassword(value);
        },
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        key: ValueKey('passwordConfirm'),
        validator: (value) {
          if (value.isEmpty ||
              value.length != authService.userPassword.length ||
              value != _passwordToMatch) {
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
          ),
        ),
        obscureText: true,
        onSaved: (value) {},
      ),
    ]);
  }
}
