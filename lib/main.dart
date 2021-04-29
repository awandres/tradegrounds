import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:storegrounds/delivery_dashboard/screens/deliverydashboard_screen.dart';
import 'package:storegrounds/product_center/providers/test_product_provider.dart';
import 'delivery_dashboard/providers/dashboard_provider.dart';
import 'product_center/providers/test_product_provider.dart';

import 'delivery_dashboard/screens/deliverydashboard_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: SignupProvider(),
        ),
        ChangeNotifierProvider.value(
          value: DashboardProvider(),
        ),
        ChangeNotifierProvider.value(value: ProductProvider())
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) =>
//-------- Cupertino app renders if platform is IOS-----------------
            //Platform.isIOS? CupertinoApp(
            //   title: 'Storegrounds',
            //   theme: CupertinoThemeData(
            //     primarySwatch: Colors.purple,
            //     errorColor: Colors.red,
            //     accentColor: Colors.amber,
            //     fontFamily: 'Quicksand',
            //     textTheme: ThemeData.light().textTheme.copyWith(
            //         title: TextStyle(
            //             fontFamily: 'OpenSans',
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18),
            //         button: TextStyle(color: Colors.white)),
            //     appBarTheme: AppBarTheme(
            //         textTheme: ThemeData.light().textTheme.copyWith(
            //             title: TextStyle(
            //                 fontFamily: 'OpenSans',
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold))
            //     )
            //   ),
            //   home: auth.isAuth
            //   ? CourierCentral()
            //   : FutureBuilder(
            //       future: auth.tryAutoLogin(),
            //       builder: (ctx, authResultSnapshot) =>
            //         authResultSnapshot.connectionState ==
            //               ConnectionState.waiting
            //           ? SplashScreen()
            //           : LoginScreen(),
            //     ),
            // )
            // :
//-------- Material app renders if platform is Android-----------------
            MaterialApp(
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
                      fontWeight: FontWeight.bold))),
          home: auth.isAuth
              ? DeliveryDashboard()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : LoginScreen(),
                ),
          // routes:
          // 'sign-up': (ctx)=>SignUpScreen(),
        ),
      ),
    );

    // USE FOR DEVELOPMENT //
    //
    // return ChangeNotifierProvider(
    //   create: (context) => SignupProvider(),
    //   child: MaterialApp(
    //     title: 'Storegrounds',
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       fontFamily: 'Quicksand',
    //       primarySwatch: Colors.blue,
    //       visualDensity: VisualDensity.adaptivePlatformDensity,
    //       primaryColor: Color.fromRGBO(255, 195, 1, 1),
    //       textTheme: ThemeData.light().textTheme.copyWith(
    //           title: TextStyle(
    //               fontSize: 29,
    //               fontFamily: 'Pacifico',
    //               fontWeight: FontWeight.bold)),
    //     ),
    //     home: StreamBuilder(
    //       stream: FirebaseAuth.instance.onAuthStateChanged,
    //       builder: (ctx, userSnapshot) {
    //         if (userSnapshot.hasData) {
    //           return DeliveryDashboard();
    //         }
    //         return LoginScreen();
    //       },
    //     ),
    //   ),
    // );

    // END DEVELOPMENT
  }
}
