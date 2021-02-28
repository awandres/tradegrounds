import 'package:authentication/providers/password_reset.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/http_exception.dart';

class EmailInput extends StatefulWidget {
  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _resetKey = GlobalKey();
    var _isLoading = false;

    Map<String, String> _payload = {
      'email': '',
    };

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
        print(_payload['email']);
        await Provider.of<PasswordReset>(context, listen: false)
            .sendPasswordResetEmail(_payload['email']);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('password reset email sent')));
      } on HttpException catch (error) {
        print(error);
        var errorMessage = 'This email does not exist.';
        _showErrorDialog(errorMessage);
      } catch (error) {
        const errorMessage = 'Network error. try again later';
        _showErrorDialog(errorMessage);
      }

      setState(() {
        _isLoading = false;
      });
    }

    final deviceSize = MediaQuery.of(context).size;

    return Container(
        height: deviceSize.height * 0.8,
        width: deviceSize.width,
        padding: EdgeInsets.only(
            bottom: 10, left: 40, right: 40, top: (deviceSize.height * 0.10)),
        child: LayoutBuilder(builder: (ctx, constraints) {
          return Container(
              width: constraints.maxWidth * 0.5,
              child: Form(
                key: _resetKey,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Storegrounds',
                          style: Theme.of(context).textTheme.title,
                        )),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'You will receive instructions to change password to you email once you submit',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                        elevation: 10.0,
                        shadowColor: Colors.black,
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20.0)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                              labelText: 'Your Email',
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                              )),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Invalid email!';
                            }
                          },
                          onSaved: (value) {
                            _payload['email'] = value;
                          },
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    !_isLoading
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 8.0),
                            color: Theme.of(context).primaryColor,
                            textColor:
                                Theme.of(context).primaryTextTheme.button.color,
                          )
                        : CircularProgressIndicator(),
                  ],
                ),
              ));
        }));
  }
}
