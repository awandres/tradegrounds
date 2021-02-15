import 'package:flutter/material.dart';

class AuthStep1 extends StatefulWidget {
  @override
  _AuthStep1State createState() => _AuthStep1State();
}

class _AuthStep1State extends State<AuthStep1> {
  String _userEmail = '';
  String _storeName = '';
  String _userPassword = '';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        decoration: const InputDecoration(
          isDense: true,
          labelText: 'Business Name',
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
        onSaved: (value) {
          _storeName = value;
        },
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        key: ValueKey('email'),
        decoration: const InputDecoration(
          isDense: true,
          labelText: 'Email',
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        validator: (value) {
          if (value.isEmpty || !value.contains('@')) {
            return 'Please enter a valid email address';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          _userEmail = value;
        },
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        key: ValueKey('password'),
        validator: (value) {
          _userPassword = value;
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
          ),
        ),
        obscureText: true,
        onSaved: (value) {
          _userPassword = value;
        },
      ),
      SizedBox(
        height: 10,
      ),
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
          ),
        ),
        obscureText: true,
        onSaved: (value) {},
      ),
    ]);
  }
}
