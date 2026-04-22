import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'services/session_service.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/goal1_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: const AuthCheck(),

    );

  }

}

/// checks login status
class AuthCheck extends StatelessWidget {

  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(

      stream: FirebaseAuth.instance.authStateChanges(),

      builder: (context, snapshot) {

        /// user already logged in
        if(snapshot.hasData){

          return HomeScreen(

            selectedWorkout: "Strivo Unleashed : Beginner",

          );

        }

        /// not logged in
        return const LoginScreen();

      },

    );

  }

}