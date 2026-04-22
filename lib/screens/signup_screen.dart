import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'goal1_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final email = TextEditingController();
  final password = TextEditingController();

  final auth = AuthService();

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

              "CREATE ACCOUNT",

              style: TextStyle(

                color: Colors.white,

                fontSize: 28,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 30),

            /// GOOGLE BUTTON
            socialButton(

              "Continue with Google",

              "assets/images/google.png",

                  () async {

                await auth.signInWithGoogle();

                Navigator.pushReplacement(

                  context,

                  MaterialPageRoute(

                    builder: (context) => const Goal1Screen(),

                  ),

                );

              },

            ),

            const SizedBox(height: 12),

            /// APPLE BUTTON
            socialButton(

              "Continue with Apple ID",

              "assets/images/apple.png",

                  () async {

                await auth.signInWithApple();

                Navigator.pushReplacement(

                  context,

                  MaterialPageRoute(

                    builder: (context) => const Goal1Screen(),

                  ),

                );

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

            const SizedBox(height: 20),

            /// CONTINUE BUTTON
            ElevatedButton(

              onPressed: () async {

                try {

                  await auth.signUp(

                    email.text.trim(),

                    password.text.trim(),

                  );

                  Navigator.pushReplacement(

                    context,

                    MaterialPageRoute(

                      builder: (context) => const Goal1Screen(),

                    ),

                  );

                }

                catch (e) {

                  ScaffoldMessenger.of(context).showSnackBar(

                    SnackBar(content: Text(e.toString())),

                  );

                }

              },

              style: ElevatedButton.styleFrom(

                backgroundColor: const Color(0xff3a3a3a),

                minimumSize: const Size(double.infinity, 55),

                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(14),

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

            /// LOGIN TEXT
            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                const Text(

                  "Already have an account?",

                  style: TextStyle(color: Colors.white70),

                ),

                TextButton(

                  onPressed: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) => const LoginScreen(),

                      ),

                    );

                  },

                  child: const Text(

                    " Login",

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

              ],

            ),

            const SizedBox(height: 5),

            /// PRIVACY TEXT
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

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    TextButton(

                      onPressed: () {},

                      child: const Text(

                        "Privacy Policy",

                        style: TextStyle(color: Colors.white),

                      ),

                    ),

                    const Text(

                      " & ",

                      style: TextStyle(color: Colors.white54),

                    ),

                    TextButton(

                      onPressed: () {},

                      child: const Text(

                        "Terms",

                        style: TextStyle(color: Colors.white),

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

  /// SOCIAL BUTTON UI
  Widget socialButton(

      String text,

      String image,

      VoidCallback onTap,

      ) {

    return SizedBox(

      width: double.infinity,

      child: ElevatedButton(

        onPressed: onTap,

        style: ElevatedButton.styleFrom(

          backgroundColor: Colors.black,

          padding: const EdgeInsets.symmetric(vertical: 16),

          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(30),

          ),

        ),

        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Image.asset(image, height: 22),

            const SizedBox(width: 12),

            Flexible(

              child: Text(

                text,

                overflow: TextOverflow.ellipsis,

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

  /// INPUT FIELD UI
  Widget inputBox(

      TextEditingController controller,

      String hint,

      [bool hide=false]

      ) {

    return TextField(

      controller: controller,

      obscureText: hide,

      style: const TextStyle(color: Colors.white),

      decoration: InputDecoration(

        hintText: hint,

        hintStyle: const TextStyle(color: Colors.white54),

        filled: true,

        fillColor: const Color(0xff3a3a3a),

        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(14),

          borderSide: BorderSide.none,

        ),

      ),

    );

  }

}