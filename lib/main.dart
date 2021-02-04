import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'courier_central/screens/couriercentral.dart';
import 'package:authentication/providers/auth.dart';
import 'package:authentication/screens/login_screen.dart';
import 'package:authentication/screens/splash_screen.dart';


void main() {
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
      ],
      child: Consumer<Auth>(
        builder: (ctx,auth, _) => MaterialApp(
          title: 'Storegrounds',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Quicksand',
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Color(0xff3EC9a8),
          ),
          home: auth.isAuth
            ? CourierCentral()
            :FutureBuilder(
              future: auth.tryAutoLogin(),
              builder: (ctx, authResultSnapshot) =>
                authResultSnapshot.connectionState ==
                      ConnectionState.waiting
                  ? SplashScreen()
                  : LoginScreen(),
            ),
          ),
      ),
    );
  }
}
