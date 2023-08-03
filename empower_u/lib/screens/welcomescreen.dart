import 'package:empower_u/screens/signinbuyer.dart';
import 'package:empower_u/screens/signinseller.dart';
import 'package:flutter/material.dart';



class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_logo.jpeg', width: 200, height: 200), 
            SizedBox(height: 20),
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInBuyer(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Adjust the button size here
                backgroundColor: Colors.indigo.shade900, // Set the button color to indigo shade 900
              ),
              child: Text('Continue as Buyer',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInSeller(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Adjust the button size here
                backgroundColor: Colors.indigo.shade900, // Set the button color to indigo shade 900
              ),
              child: Text('Continue as Seller',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}