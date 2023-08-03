import 'package:empower_u/screens/signupscreen.dart';
import 'package:flutter/material.dart';


import 'loginscreen.dart';

class EmpowerU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmpowerU',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmpowerU'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to EmpowerU',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignIn()),
  );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignIn()),
  );
              },
              child: Text('SignUp'),
            ),
          ],
        ),
      ),
    );
  }
}