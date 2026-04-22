import 'package:flutter/material.dart';
import 'goal4_screen.dart';

class Goal3Screen extends StatefulWidget {
  const Goal3Screen({super.key});

  @override
  State<Goal3Screen> createState() => _Goal3ScreenState();
}

class _Goal3ScreenState extends State<Goal3Screen> {

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
                    "Step 3 to 7",
                    style: TextStyle(fontSize: 16),
                  ),

                ],

              ),

            ),

            /// PROGRESS BAR
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: LinearProgressIndicator(

                value: 3/7,

                minHeight: 6,

                backgroundColor: Colors.grey.shade300,

                color: Colors.black,

              ),

            ),

            const SizedBox(height: 18),

            /// CONTENT
            Expanded(

              child: SingleChildScrollView(

                child: Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 22),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      /// TITLE
                      const Text(

                        "NICE WORK, NAME. LET’S\nFINALIZE YOUR FITNESS PLAN.",

                        style: TextStyle(

                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                          letterSpacing: 0.2,

                        ),

                      ),

                      const SizedBox(height: 18),

                      /// DESCRIPTION BOX
                      Container(

                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(

                          color: const Color(0xff6a6464),

                          borderRadius: BorderRadius.circular(14),

                        ),

                        child: const Text(

                          "Plans include workouts, meals, and mindset coaching designed to achieve your goals.",

                          style: TextStyle(

                            color: Colors.white,
                            fontSize: 15,
                            height: 1.4,

                          ),

                        ),

                      ),

                      const SizedBox(height: 22),

                      /// GRID
                      Row(

                        children: [

                          Expanded(child: planCard("MOVE", "assets/images/move.jpg", const Color(0xff8fb6c1))),

                          const SizedBox(width: 14),

                          Expanded(child: planCard("SPORTS", "assets/images/sports.jpg", const Color(0xffd8c6a0))),

                        ],

                      ),

                      const SizedBox(height: 14),

                      Row(

                        children: [

                          Expanded(child: planCard("MEAL", "assets/images/meal.jpg", const Color(0xffe8d6a8))),

                          const SizedBox(width: 14),

                          Expanded(child: planCard("MIND", "assets/images/mind.jpg", const Color(0xffa9cdd4))),

                        ],

                      ),

                      const SizedBox(height: 20),

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

                  onPressed: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) => const Goal4Screen(),

                      ),

                    );

                  },

                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.black,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(14),

                    ),

                  ),

                  child: const Text(

                    "FINALIZE YOUR PLAN",

                    style: TextStyle(

                      color: Color(0xffE5D48A),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,

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

  /// CARD UI
  Widget planCard(String title, String image, Color labelColor) {

    return Stack(

      children: [

        ClipRRect(

          borderRadius: BorderRadius.circular(18),

          child: Image.asset(

            image,

            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,

          ),

        ),

        Positioned(

          top: 10,
          left: 10,

          child: Container(

            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

            decoration: BoxDecoration(

              color: labelColor,
              borderRadius: BorderRadius.circular(20),

            ),

            child: Text(

              title,

              style: const TextStyle(

                fontWeight: FontWeight.bold,

              ),

            ),

          ),

        ),

      ],

    );

  }

}