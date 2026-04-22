import 'dart:ui';
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SizedBox.expand(

        child: Stack(

          fit: StackFit.expand,

          children: [

            /// FULL SCREEN BACKGROUND
            Image.asset(

              "assets/images/welcome_bg.jpg",

              fit: BoxFit.cover,

              alignment: Alignment.center,

            ),

            /// DARK OVERLAY
            Container(

              color: Colors.black.withOpacity(0.35),

            ),

            /// CONTENT
            SafeArea(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.end,

                children: [

                  const Padding(

                    padding: EdgeInsets.symmetric(horizontal: 30),

                    child: Text(

                      "TRANSFORM YOUR BODY,\nSTRENGTH YOUR MIND",

                      textAlign: TextAlign.center,

                      style: TextStyle(

                        color: Colors.white,

                        fontSize: 20,

                        fontWeight: FontWeight.bold,

                        letterSpacing: 1,

                      ),

                    ),

                  ),

                  const SizedBox(height: 20),

                  /// GLASS BUTTON
                  GestureDetector(

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) => const SignupScreen(),

                        ),

                      );

                    },

                    child: ClipRRect(

                      borderRadius: BorderRadius.circular(40),

                      child: BackdropFilter(

                        filter: ImageFilter.blur(

                          sigmaX: 10,

                          sigmaY: 10,

                        ),

                        child: Container(

                          width: 260,

                          padding: const EdgeInsets.symmetric(vertical: 16),

                          alignment: Alignment.center,

                          decoration: BoxDecoration(

                            color: Colors.white.withOpacity(0.25),

                            borderRadius: BorderRadius.circular(40),

                            border: Border.all(

                              color: Colors.white.withOpacity(0.3),

                            ),

                          ),

                          child: const Text(

                            "GET STARTED",

                            style: TextStyle(

                              color: Colors.black,

                              fontWeight: FontWeight.bold,

                              letterSpacing: 1,

                            ),

                          ),

                        ),

                      ),

                    ),

                  ),

                  const SizedBox(height: 15),

                  TextButton(

                    onPressed: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) => const LoginScreen(),

                        ),

                      );

                    },

                    child: const Text(

                      "Already a Strivo Member? LOG IN",

                      style: TextStyle(color: Colors.white70),

                    ),

                  ),

                  const SizedBox(height: 40),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}