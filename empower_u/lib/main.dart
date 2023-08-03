import 'package:empower_u/screens/signinbuyer.dart';
import 'package:empower_u/screens/signinseller.dart';
import 'package:empower_u/screens/splash_screen.dart';
import 'package:empower_u/screens/welcomescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
       initialRoute: 'splash_screen',
      routes: {
        'welcomescreen':(context)=>  WelcomeScreen(),
        'loginscreen': (context) => SignInSeller(),
        'signupscreen': (context) =>   SignInBuyer(),
        'splash_screen': (context) => const SplashScreen(),
        // 'home_screen': (context) =>  MobileScreenLayout(),
        // 'profile': (context) => ProfilePage(),
        // 'aboutus': (context) => AboutUsPage(),
        // 'yourcart': (context) => CartPage(),
        // 'buyart': (context) => BuyArtPage(),
        // 'search': (context) => SearchPage(),
        // 'singing': (context) => SingingPage(),
      },
    );
  }
}

 