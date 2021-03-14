import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:storegrounds/delivery_dashboard/screens/deliverydashboard.dart';

import 'delivery_dashboard/screens/deliverydashboard.dart';
import 'package:authentication/providers/auth.dart';
import 'package:authentication/screens/login_screen.dart';
import 'package:authentication/screens/splash_screen.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:authentication/screens/signup_screen.dart';
import 'package:authentication/providers/signup_provider.dart';
import 'dart:io';

void main() {
  // To lock screen orientation
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupProvider(),
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
            if (userSnapshot.hasData) {
              return DeliveryDashboard();
            }
            return LoginScreen();
          },
        ),
      ),
      // home: CourierCentral(),);
    );
  }
}
