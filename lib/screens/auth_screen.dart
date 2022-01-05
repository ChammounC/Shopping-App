import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oyelabs/screens/location_screen.dart';
import 'package:oyelabs/screens/log_in_screen.dart';
import 'package:oyelabs/screens/otp_screen.dart';

import 'home.dart';

class AuthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData){
            return LocationScreen();
          }else if(snapshot.hasError){
            return LogInScreen();
          }else{
            return LogInScreen();
          }
        },
      ),
    );
  }
}
