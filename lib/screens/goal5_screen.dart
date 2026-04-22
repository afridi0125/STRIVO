import 'package:flutter/material.dart';
import 'goal6_screen.dart';

class Goal5Screen extends StatefulWidget {
  const Goal5Screen({super.key});

  @override
  State<Goal5Screen> createState() => _Goal5ScreenState();
}

class _Goal5ScreenState extends State<Goal5Screen> {

  String selectedLevel = "";

  bool get isValid => selectedLevel.isNotEmpty;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: Column(

          children: [

            /// HEADER
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  IconButton(

                    onPressed: () {

                      Navigator.pop(context);

                    },

                    icon: const Icon(Icons.arrow_back),

                  ),

                  const Text(
                    "Step 5 to 7",
                    style: TextStyle(fontSize: 16),
                  ),

                ],

              ),

            ),

            /// PROGRESS BAR
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: LinearProgressIndicator(

                value: 5/7,

                minHeight: 6,

                backgroundColor: Colors.grey.shade300,

                color: Colors.black,

              ),

            ),

            const SizedBox(height: 20),

            /// BODY
            Expanded(

              child: ListView(

                padding: const EdgeInsets.symmetric(horizontal: 22),

                children: [

                  /// TITLE
                  const Text(

                    "HOW WOULD YOU RATE YOUR\nCURRENT LEVEL OF FITNESS?",

                    style: TextStyle(

                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      height: 1.1,

                    ),

                  ),

                  const SizedBox(height: 28),

                  optionTile("Beginner or returning to exercise"),

                  optionTile("Intermediate"),

                  optionTile("Advanced"),

                ],

              ),

            ),

            /// CONTINUE BUTTON
            Padding(

              padding: const EdgeInsets.all(20),

              child: SizedBox(

                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  onPressed: isValid
                      ? () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) => const Goal6Screen(),

                      ),

                    );

                  }
                      : null,

                  style: ElevatedButton.styleFrom(

                    backgroundColor: isValid
                        ? Colors.black
                        : Colors.grey.shade300,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(14),

                    ),

                  ),

                  child: Text(

                    "CONTINUE",

                    style: TextStyle(

                      color: isValid
                          ? const Color(0xffE5D48A)
                          : Colors.black,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }


  /// OPTION TILE
  Widget optionTile(String title) {

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedLevel = title;

        });

      },

      child: Container(

        margin: const EdgeInsets.only(bottom: 18),

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

        decoration: BoxDecoration(

          color: Colors.grey.shade300,

          borderRadius: BorderRadius.circular(18),

        ),

        child: Row(

          children: [

            Radio(

              value: title,

              groupValue: selectedLevel,

              onChanged: (value) {

                setState(() {

                  selectedLevel = value.toString();

                });

              },

              activeColor: Colors.black,

            ),

            const SizedBox(width: 8),

            Expanded(

              child: Text(

                title,

                style: const TextStyle(

                  fontSize: 18,
                  fontWeight: FontWeight.w600,

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}