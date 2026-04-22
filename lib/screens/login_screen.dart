import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/session_service.dart';

import 'signup_screen.dart';
import 'goal1_screen.dart';
import 'home_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final email = TextEditingController();
  final password = TextEditingController();

  final auth = AuthService();

  /// AFTER LOGIN NAVIGATION
  Future goNextScreen() async {

    await SessionService.setLoggedIn(true);

    bool goalDone =
    await SessionService.isGoalCompleted();

    if(goalDone){

      String workout =
          await SessionService.getWorkout()
              ?? "Strivo Unleashed : Beginner";

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              HomeScreen(
                selectedWorkout: workout,
              ),
        ),
      );

    }
    else{

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
          const Goal1Screen(),
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xff1f1f1f),

      body: Padding(

        padding: const EdgeInsets.all(24),

        child: ListView(

          children: [

            const SizedBox(height: 40),

            const Text(

              "WELCOME BACK!",

              style: TextStyle(

                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 30),

            /// GOOGLE LOGIN
            socialButton(

              "Continue with Google",
              "assets/images/google.png",

                  () async {

                try{

                  await auth.signInWithGoogle();

                  await goNextScreen();

                }

                catch(e){

                  showError(e.toString());

                }

              },

            ),

            const SizedBox(height: 12),

            /// APPLE LOGIN
            socialButton(

              "Continue with Apple ID",
              "assets/images/apple.png",

                  () async {

                try{

                  await auth.signInWithApple();

                  await goNextScreen();

                }

                catch(e){

                  showError(e.toString());

                }

              },

            ),

            const SizedBox(height: 20),

            Row(

              children: const [

                Expanded(child: Divider(color: Colors.white24)),

                Padding(

                  padding: EdgeInsets.symmetric(horizontal: 10),

                  child: Text(

                    "or",

                    style: TextStyle(color: Colors.white54),

                  ),

                ),

                Expanded(child: Divider(color: Colors.white24)),

              ],

            ),

            const SizedBox(height: 20),

            inputBox(email, "Email*"),

            const SizedBox(height: 12),

            inputBox(password, "Password*", true),

            const SizedBox(height: 8),

            /// FORGOT PASSWORD
            Align(

              alignment: Alignment.centerRight,

              child: TextButton(

                onPressed: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) =>
                      const ForgotPasswordScreen(),

                    ),

                  );

                },

                child: const Text(

                  "Forgot Password?",

                  style: TextStyle(color: Colors.white54),

                ),

              ),

            ),

            const SizedBox(height: 10),

            /// EMAIL LOGIN BUTTON
            ElevatedButton(

              onPressed: () async {

                try{

                  await auth.login(

                    email.text.trim(),
                    password.text.trim(),

                  );

                  await goNextScreen();

                }

                catch(e){

                  showError(e.toString());

                }

              },

              style: ElevatedButton.styleFrom(

                backgroundColor:
                const Color(0xff3a3a3a),

                minimumSize:
                const Size(double.infinity,55),

                shape: RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.circular(14),

                ),

              ),

              child: const Text(

                "CONTINUE",

                style: TextStyle(

                  color: Color(0xffe5d48a),

                  fontWeight: FontWeight.bold,

                ),

              ),

            ),

            const SizedBox(height: 18),

            /// SIGNUP
            Row(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                const Text(

                  "Don't have an account?",

                  style: TextStyle(
                      color: Colors.white70
                  ),

                ),

                TextButton(

                  onPressed: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                        const SignupScreen(),

                      ),

                    );

                  },

                  child: const Text(

                    " Sign Up",

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),

                ),

              ],

            ),

            const SizedBox(height: 5),

            /// TERMS
            Column(

              children: [

                const Text(

                  "By continuing you agree to our",

                  style: TextStyle(

                    color: Colors.white54,
                    fontSize: 12,

                  ),

                ),

                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.center,

                  children: [

                    TextButton(

                      onPressed: () {},

                      child: const Text(

                        "Privacy Policy",

                        style: TextStyle(
                            color: Colors.white
                        ),

                      ),

                    ),

                    const Text(

                      " & ",

                      style: TextStyle(
                          color: Colors.white54
                      ),

                    ),

                    TextButton(

                      onPressed: () {},

                      child: const Text(

                        "Terms",

                        style: TextStyle(
                            color: Colors.white
                        ),

                      ),

                    ),

                  ],

                ),

              ],

            ),

          ],

        ),

      ),

    );

  }

  /// ERROR SNACKBAR
  void showError(String message){

    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(content: Text(message)),

    );

  }

  /// SOCIAL BUTTON UI
  Widget socialButton(

      String text,
      String image,
      VoidCallback onTap,

      ){

    return SizedBox(

      width: double.infinity,

      child: ElevatedButton(

        onPressed: onTap,

        style: ElevatedButton.styleFrom(

          backgroundColor: Colors.black,

          padding:
          const EdgeInsets.symmetric(vertical:16),

          shape: RoundedRectangleBorder(

            borderRadius:
            BorderRadius.circular(30),

          ),

        ),

        child: Row(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Image.asset(image,height:22),

            const SizedBox(width:12),

            Flexible(

              child: Text(

                text,

                overflow:
                TextOverflow.ellipsis,

                style: const TextStyle(

                  color: Colors.white,
                  fontSize: 15,

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

  /// INPUT FIELD
  Widget inputBox(

      TextEditingController controller,
      String hint,

      [bool hide=false]

      ){

    return TextField(

      controller: controller,

      obscureText: hide,

      style:
      const TextStyle(color: Colors.white),

      decoration: InputDecoration(

        hintText: hint,

        hintStyle:
        const TextStyle(color: Colors.white54),

        filled: true,

        fillColor:
        const Color(0xff3a3a3a),

        border: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(14),

          borderSide: BorderSide.none,

        ),

      ),

    );

  }

}