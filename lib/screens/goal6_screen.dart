import 'package:flutter/material.dart';
import 'goal7_screen.dart';

class Goal6Screen extends StatefulWidget {
  const Goal6Screen({super.key});

  @override
  State<Goal6Screen> createState() => _Goal6ScreenState();
}

class _Goal6ScreenState extends State<Goal6Screen> {

  String selectedDiet = "";

  bool get isValid => selectedDiet.isNotEmpty;

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
                    "Step 6 to 7",
                    style: TextStyle(fontSize: 16),
                  ),

                ],

              ),

            ),

            /// PROGRESS BAR
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: LinearProgressIndicator(

                value: 6/7,

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

                    "NAME, WHAT’S YOUR\nPREFERRED DIET?",

                    style: TextStyle(

                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      height: 1.1,

                    ),

                  ),

                  const SizedBox(height: 18),

                  /// INFO BOX
                  Container(

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color: const Color(0xff6a6464),

                      borderRadius: BorderRadius.circular(14),

                    ),

                    child: const Text(

                      "Good nutrition is the key to optimizing your performance and hitting your goals.",

                      style: TextStyle(

                        color: Colors.white,
                        fontSize: 15,

                      ),

                    ),

                  ),

                  const SizedBox(height: 24),

                  optionTile("BOTH VEG & NON-VEG"),

                  optionTile("ONLY VEGETARIAN"),

                  optionTile("ONLY NON-VEGETARIAN"),

                ],

              ),

            ),

            /// BUTTON
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

                        builder: (context) => const Goal7Screen(),

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

                    "POWER THROUGH",

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

          selectedDiet = title;

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

              groupValue: selectedDiet,

              onChanged: (value) {

                setState(() {

                  selectedDiet = value.toString();

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