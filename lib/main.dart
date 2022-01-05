import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oyelabs/providers/address_provider.dart';
import 'package:oyelabs/providers/firebase_provider.dart';
import 'package:oyelabs/providers/google_provider.dart';
import 'package:oyelabs/screens/auth_screen.dart';
import 'package:oyelabs/screens/home.dart';
import 'package:oyelabs/screens/location_screen.dart';
import 'package:oyelabs/screens/log_in_screen.dart';
import 'package:oyelabs/screens/otp_screen.dart';
import 'package:oyelabs/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AddressProvider>(
            create: (_) => AddressProvider()),
        ChangeNotifierProvider<FirebaseProvider>(
            create: (_) => FirebaseProvider()),
        ChangeNotifierProvider<GoogleSignInProvider>(
            create: (_) => GoogleSignInProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: '/signUp',
      routes: {
        '/signUp': (context) => SignUpScreen(),
        '/logIn': (context) => LogInScreen(),
        '/otp': (context) => OtpScreen(),
        '/location': (context) => LocationScreen(),
        '/home': (context) => HomeScreen(),
        '/auth': (context) => AuthScreen(),
      },
    );
  }
}
