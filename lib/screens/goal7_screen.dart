import 'package:flutter/material.dart';
import 'workout_selection_screen.dart';

class Goal7Screen extends StatefulWidget {
  const Goal7Screen({super.key});

  @override
  State<Goal7Screen> createState() => _Goal7ScreenState();
}

class _Goal7ScreenState extends State<Goal7Screen> {

  List<String> selectedMindset = [];

  bool get isValid => selectedMindset.isNotEmpty;

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
                    "Step 7 to 7",
                    style: TextStyle(fontSize: 16),
                  ),

                ],

              ),

            ),

            /// PROGRESS BAR
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: LinearProgressIndicator(

                value: 7/7,

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

                    "WHAT MINDSET ACTIVITIES\nCAN WE SUPPORT WITH YOU",

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

                      "REVAA Members are more likely to hit their goals with mindset activities. you can choose multiple.",

                      style: TextStyle(

                        color: Colors.white,
                        fontSize: 15,

                      ),

                    ),

                  ),

                  const SizedBox(height: 24),

                  optionTile("Improve focus and motivation"),

                  optionTile("Increase relaxation"),

                  optionTile("Sleep better"),

                  optionTile("Reduce stress and anxiety"),

                  optionTile("None of the above"),

                  const SizedBox(height: 20),

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

                    Navigator.pushReplacement(

                      context,

                      MaterialPageRoute(

                        builder: (context) =>
                        const WorkoutSelectionScreen(),

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

                    "FINISH & START",

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


  /// MULTI SELECT TILE
  Widget optionTile(String title) {

    bool isSelected = selectedMindset.contains(title);

    return GestureDetector(

      onTap: () {

        setState(() {

          if (isSelected) {

            selectedMindset.remove(title);

          } else {

            selectedMindset.add(title);

          }

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

            Checkbox(

              value: isSelected,

              onChanged: (value) {

                setState(() {

                  if (value == true) {

                    selectedMindset.add(title);

                  } else {

                    selectedMindset.remove(title);

                  }

                });

              },

              activeColor: Colors.black,

              checkColor: Colors.white,

              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(4),

              ),

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