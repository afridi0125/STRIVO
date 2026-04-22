import 'package:flutter/material.dart';
import 'goal3_screen.dart';

class Goal2Screen extends StatefulWidget {
  const Goal2Screen({super.key});

  @override
  State<Goal2Screen> createState() => _Goal2ScreenState();
}

class _Goal2ScreenState extends State<Goal2Screen> {

  String selectedGoal = "";

  bool get isValid => selectedGoal.isNotEmpty;

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
                    "Step 2 to 7",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),

                ],

              ),

            ),

            /// PROGRESS BAR
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: LinearProgressIndicator(

                value: 2/7,

                minHeight: 6,

                backgroundColor: Colors.grey.shade300,

                color: Colors.black,

              ),

            ),

            const SizedBox(height: 20),

            Expanded(

              child: SingleChildScrollView(

                child: Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 22),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      const Text(

                        "WHAT’S YOUR TOP FITNESS\nGOAL, NAME?",

                        style: TextStyle(

                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          height: 1.1,

                        ),

                      ),

                      const SizedBox(height: 28),

                      goalOption("Lose Fat"),
                      goalOption("Build Strength"),
                      goalOption("Get Toned"),
                      goalOption("Gain Muscle"),
                      goalOption("Stay Healthy and Fit"),
                      goalOption("Sports Fitness"),
                      goalOption("Everyday Strength and Mobility"),

                      const SizedBox(height: 10),

                    ],

                  ),

                ),

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

                        builder: (context) => const Goal3Screen(),

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

                    "TAKE THE NEXT STEP",

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


  /// RADIO OPTION UI
  Widget goalOption(String title) {

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedGoal = title;

        });

      },

      child: Container(

        margin: const EdgeInsets.only(bottom: 14),

        padding: const EdgeInsets.symmetric(horizontal: 12),

        decoration: BoxDecoration(

          color: Colors.grey.shade300,

          borderRadius: BorderRadius.circular(14),

        ),

        child: RadioListTile(

          value: title,

          groupValue: selectedGoal,

          onChanged: (value) {

            setState(() {

              selectedGoal = value.toString();

            });

          },

          activeColor: Colors.black,

          title: Text(

            title,

            style: const TextStyle(

              fontSize: 16,

            ),

          ),

          contentPadding: EdgeInsets.zero,

        ),

      ),

    );

  }

}