import 'package:empower_u/screens/signupseller.dart';
import 'package:flutter/material.dart';

class SignInSeller extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Form key to handle form validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EmpowerU',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat-ExtraBold', 
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: Center( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/app_logo.jpeg', 
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                Text(
                  'Login as Seller',
                  style: TextStyle(
                    fontFamily: 'Montserrat-ExtraBold', 
                    fontSize: 30,
                    fontWeight: FontWeight.w800, 
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  width: 500, 
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.indigo.shade900,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email, color: Colors.indigo.shade900), 
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // add validation logic later
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  width: 500, 
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.indigo.shade900,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock, color: Colors.indigo.shade900), 
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      // add pass validation later
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, add your login logic here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade900,
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpSeller(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'New User? Sign Up',
                    style: TextStyle(
                      color: Colors.indigo.shade900,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Montserrat-ExtraBold', 
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
