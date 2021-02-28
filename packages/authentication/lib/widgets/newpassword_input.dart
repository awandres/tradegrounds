import 'package:authentication/providers/password_reset.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/http_exception.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _resetKey = GlobalKey();
    var _isLoading = false;

    Map<String, String> _payload = {'newPassword': ''};

    void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occurred!'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }

    Future<void> _submit() async {
      if (!_resetKey.currentState.validate()) {
        // Invalid!
        return;
      }
      _resetKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      try {
        // sending new password with oobCode
        await Provider.of<PasswordReset>(context, listen: false)
            .passwordResetConfirm(_payload['newPassword']);
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

    return Column(
      children: <Widget>[
        TextFormField(
          // controller: _passwordController,
          decoration: const InputDecoration(
              labelStyle: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
              isDense: true,
              labelText: 'New Password',
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              )),
          obscureText: true,
          // controller: _passwordController,
          validator: (value) {
            if (value.isEmpty || value.length < 5) {
              return 'Password is too short!';
            }
          },
          onSaved: (value) {
            _payload['newPassword'] = value;
          },
        ),
        _isLoading
            ? RaisedButton(
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _submit,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryTextTheme.button.color,
              )
            : CircularProgressIndicator(),
      ],
    );
  }
}
