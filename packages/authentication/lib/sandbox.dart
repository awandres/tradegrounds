 // import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/auth.dart';
// import '../models/http_exception.dart';
// import './password_reset_screen.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _signupKey = GlobalKey();
//   Map<String, String> _authData = {
//     'email': '',
//     'password': '',
//   };
//   var _isLoading = false;
//   final _passwordController = TextEditingController();

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('An Error Occurred!'),
//         content: Text(message),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Okay'),
//             onPressed: () {
//               Navigator.of(ctx).pop();
//             },
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> _submit() async {
//     if (!_signupKey.currentState.validate()) {
//       // Invalid!
//       return;
//     }
//     _signupKey.currentState.save();
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       // Sign user up
//       await Provider.of<Auth>(context, listen: false).login(
//         _authData['email'],
//         _authData['password'],
//       );
//     } on HttpException catch (error) {
//       var errorMessage = 'Authentication failed';
//       if (error.toString().contains('EMAIL_EXISTS')) {
//         errorMessage = 'This email address is already in use.';
//       } else if (error.toString().contains('INVALID_EMAIL')) {
//         errorMessage = 'This is not a valid email address';
//       } else if (error.toString().contains('WEAK_PASSWORD')) {
//         errorMessage = 'This password is too weak.';
//       } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
//         errorMessage = 'Email or password is incorrect.';
//       } else if (error.toString().contains('INVALID_PASSWORD')) {
//         errorMessage = 'Email or password is incorrect.';
//       }
//       _showErrorDialog(errorMessage);
//     } catch (error) {
//       const errorMessage =
//           'Could not authenticate you. Please try again later.';
//       _showErrorDialog(errorMessage);
//     }

//     setState(() {
//       _isLoading = false;
//     });
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
//               bottom: 10, left: 40, right: 40, top: (deviceSize.height * 0.10)),
//           child: LayoutBuilder(builder: (ctx, constraints) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Material(
//                   elevation: 10.0,
//                   shadowColor: Colors.black,
//                   borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
//                   child: Container(
//                     // decoration: BoxDecoration(
//                     //   borderRadius: BorderRadius.all(Radius.circular(20)),
//                     //   boxShadow: [
//                     //     BoxShadow(
//                     //       color: Colors.grey.withOpacity(0.5),
//                     //       spreadRadius: 5,
//                     //       blurRadius: 7,
//                     //       offset: Offset(0, 20), // changes position of shadow
//                     //     ),
//                     //   ]
//                     // ),
//                     height: constraints.maxHeight * 0.35,
//                     width: double.infinity,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       child: Image.asset(
//                         'assets/images/storegroundsLogo.png',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(20),
//                   child: Text(
//                     'Storegrounds',
//                     style: Theme.of(context).textTheme.title,
//                   )
//                 ),
//                 Container(
//                   height: constraints.maxHeight*0.40,
//                   child: Form(
//                     key: _signupKey,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: <Widget>[
//                           Material(
//                             elevation: 10.0,
//                             shadowColor: Colors.black,
//                             borderRadius: const BorderRadius.all(
//                                 const Radius.circular(20.0)),
//                             child: TextFormField(
//                               decoration: const InputDecoration(
//                                 labelStyle: TextStyle(
//                                   fontFamily: 'Quicksand',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 isDense: true,
//                                 labelText: 'E-Mail',
//                                 border: OutlineInputBorder(
//                                   borderRadius: const BorderRadius.all(
//                                     const Radius.circular(20.0),
//                                   ),
//                                 )
//                               ),
//                               keyboardType: TextInputType.emailAddress,
//                               validator: (value) {
//                                 if (value.isEmpty || !value.contains('@')) {
//                                   return 'Invalid email!';
//                                 }
//                               },
//                               onSaved: (value) {
//                                 _authData['email'] = value;
//                               },
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Material(
//                             elevation: 10.0,
//                             shadowColor: Colors.black,
//                             borderRadius: const BorderRadius.all(
//                                 const Radius.circular(20.0)),
//                             child: TextFormField(
//                               decoration: const InputDecoration(
//                                 labelStyle: TextStyle(
//                                   fontFamily: 'Quicksand',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 isDense: true,
//                                 labelText: 'Password',
//                                 border: OutlineInputBorder(
//                                   borderRadius: const BorderRadius.all(
//                                     const Radius.circular(20.0),
//                                   ),
//                                 )
//                               ),
//                               obscureText: true,
//                               controller: _passwordController,
//                               validator: (value) {
//                                 if (value.isEmpty || value.length < 5) {
//                                   return 'Password is too short!';
//                                 }
//                               },
//                               onSaved: (value) {
//                                 _authData['password'] = value;
//                               },
//                             ),
//                           ),
//                           // if (_isLoading)
//                           //   CircularProgressIndicator()
//                           // else
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               const Text(
//                                 'New User ? ',
//                                 style: TextStyle(
//                                   fontFamily: 'Quicksand',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               FlatButton(
//                                 child: const Text(
//                                   'Sign Up',
//                                   style: TextStyle(
//                                     fontFamily: 'Quicksand',
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationScreen()));
//                                 },
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 30.0, vertical: 4),
//                                 materialTapTargetSize:
//                                     MaterialTapTargetSize.shrinkWrap,
//                                 textColor: Theme.of(context).primaryColor,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           RaisedButton(
//                             child: const Text(
//                               'LOGIN',
//                               style: TextStyle(
//                                 fontFamily: 'Quicksand',
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             onPressed: _submit,
//                             elevation: 10,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 8.0),
//                             color: Theme.of(context).primaryColor,
//                             textColor:
//                                 Theme.of(context).primaryTextTheme.button.color,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           FlatButton(
//                                 child: const Text(
//                                   'Forgot your Password ?',
//                                   style: TextStyle(
//                                     fontFamily: 'Quicksand',
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PasswordResetScreen()));
//                                 },
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 30.0, vertical: 4),
//                                 materialTapTargetSize:
//                                     MaterialTapTargetSize.shrinkWrap,
//                                 textColor: Colors.black,
//                               ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                     height: constraints.maxHeight*0.07,
//                     width: deviceSize.width,
//                     // color: Colors.black,
//                     // padding: EdgeInsets.only(left: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Image.asset(
//                           'assets/images/tradegroundsIg.png',
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(
//                           width: 30,
//                         ),
//                         FittedBox(
//                           child: Column(
//                             children: <Widget>[
//                               Text(
//                                 'Tradegrounds Inc. 2077',
//                                 style: TextStyle(
//                                   fontFamily: 'Quicksand',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 'www.tradegrounds.info',
//                                 style: TextStyle(
//                                   fontFamily: 'Quicksand',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 'v.0.0.1',
//                                 style: TextStyle(
//                                   fontFamily: 'Quicksand',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
