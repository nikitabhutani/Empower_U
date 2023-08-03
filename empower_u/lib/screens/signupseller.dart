import 'package:flutter/material.dart';

class SignUpSeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Sign Up'),
        backgroundColor: Colors.indigo.shade900, 
      ),
      body: SingleChildScrollView( 
        child: Center( 
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 80), 
            child: Column(
              children: [
                Image.asset(
                  'assets/images/app_logo.jpeg', 
                  width: 150, 
                  height: 150, 
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome To EmpowerU',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade900,
                  ),
                ),
                SizedBox(height: 40,width:40),
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
                  child: Row(
                    children: [
                      Icon(Icons.email, color: Colors.indigo.shade900), 
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1, // Set flex to 1 to make the width equal
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
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
                  child: Row(
                    children: [
                      Icon(Icons.lock, color: Colors.indigo.shade900), 
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1, // Set flex to 1 to make the width equal
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add  sign-up logic later
                    //add navigor push right now
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade900,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
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
