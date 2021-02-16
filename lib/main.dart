import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'courier_central/screens/couriercentral.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:authentication/screens/auth_screen.dart';
import 'package:authentication/providers/auth_provider.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Storegrounds',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Quicksand',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color.fromRGBO(255, 195, 1, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontSize: 29,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold)),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            // if (userSnapshot.hasData) {
            //   return CourierCentral();
            // }
            return Signup();
          },
        ),
      ),
    );
  }
}
