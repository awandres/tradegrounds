// OLD CODE - MAY KEEP FOR FIREBASE AUTH LATER

// import 'package:flutter/material.dart';
// import 'auth_step_1.dart';
// import 'auth_step_2.dart';
// import 'auth_step_3.dart';

// class AuthForm extends StatefulWidget {
//   AuthForm(this.submitFn, this.isLoading);

//   final bool isLoading;
//   final void Function(
//     String _userEmail,
//     String _storeName,
//     String _userPassword,
//     bool isLogin,
//     BuildContext ctx,
//   ) submitFn;

//   @override
//   _AuthFormState createState() => _AuthFormState();
// }

// class _AuthFormState extends State<AuthForm> {
//   bool termsValid = true;
//   bool termsAgreed = false;
//   final _formKey = GlobalKey<FormState>();
//   var _isLogin = false;
//   int _signupStep = 1;
//   String _userEmail = '';
//   String _storeName = '';
//   String _userPassword = '';

//   void _trySubmit() {
//     final isValid = _formKey.currentState.validate();
//     FocusScope.of(context).unfocus();
//     // print('terms agreed is $termsAgreed');
//     print('Auth step is $_signupStep');

//     // if (_signupStep == 3 && !termsAgreed) {
//     //   setState(() => termsValid = termsAgreed);
//     //   return;
//     // }

//     if (isValid) {
//       setState(() {
//         if (_signupStep == 3) {
//           _signupStep = 1;
//         } else {
//           _signupStep = _signupStep + 1;
//         }
//       });

//       _formKey.currentState.save();
//       if (_signupStep == 3)
//         widget.submitFn(
//           _userEmail.trim(),
//           _userPassword.trim(),
//           _storeName.trim(),
//           _isLogin,
//           context,
//         );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: deviceSize.height,
//           width: deviceSize.width,
//           padding: EdgeInsets.only(
//               bottom: 0, left: 40, right: 40, top: (deviceSize.height * 0.05)),
//           child: LayoutBuilder(
//             builder: (ctx, constraints) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: deviceSize.width,
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(255, 195, 1, 1),
//                         borderRadius: BorderRadius.all(Radius.circular(20))),
//                     child: Text(
//                       'Storegrounds',
//                       style: Theme.of(context).textTheme.title,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   if (_signupStep == 1)
//                     Flexible(
//                       child: Container(
//                         height: constraints.maxHeight * 0.3,
//                         width: double.infinity,
//                         child: Image.asset(
//                           'assets/images/storegrounds_swoop.png',
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                   Flexible(
//                     flex: deviceSize.width > 600 ? 2 : 1,
//                     child: Form(
//                       key: _formKey,
//                       child: SingleChildScrollView(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             if (_signupStep >= 2)
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   FlatButton(
//                                     child: Text('< Back'),
//                                     textColor: Colors.grey,
//                                     onPressed: () {
//                                       setState(() {
//                                         _signupStep = _signupStep - 1;
//                                         print(_signupStep);
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             if (_signupStep == 1) AuthStep1(),
//                             if (!widget.isLoading && _signupStep == 1)
//                               FlatButton(
//                                 textColor: Theme.of(context).primaryColor,
//                                 child: Text.rich(
//                                   TextSpan(
//                                     text: 'Login? ',
//                                     children: <TextSpan>[
//                                       TextSpan(
//                                         text: 'Click Here',
//                                         style: TextStyle(
//                                           decoration: TextDecoration.underline,
//                                           color: Colors.blue,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             if (_signupStep == 2) AuthStep2(),
//                             if (_signupStep == 3) AuthStep3(),
//                             if (_signupStep == 3)
//                               SizedBox(height: 20)
//                             else
//                               SizedBox(height: 0),
//                             if (widget.isLoading) CircularProgressIndicator(),
//                             if (!widget.isLoading)
//                               RaisedButton(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 30.0, vertical: 8.0),
//                                   color: Theme.of(context).primaryColor,
//                                   textColor: Theme.of(context)
//                                       .primaryTextTheme
//                                       .button
//                                       .color,
//                                   child: Text((_signupStep == 2)
//                                       ? 'Next'
//                                       : (_signupStep == 3)
//                                           ? 'Submit'
//                                           : 'Sign Up'),
//                                   onPressed: _trySubmit),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
