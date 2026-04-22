import 'package:flutter/material.dart';
import 'goal5_screen.dart';

class Goal4Screen extends StatefulWidget {
  const Goal4Screen({super.key});

  @override
  State<Goal4Screen> createState() => _Goal4ScreenState();
}

class _Goal4ScreenState extends State<Goal4Screen> {

  String selectedType = "";

  bool get isValid => selectedType.isNotEmpty;

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
                    "Step 4 to 7",
                    style: TextStyle(fontSize: 16),
                  ),

                ],

              ),

            ),

            /// PROGRESS BAR
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: LinearProgressIndicator(

                value: 4/7,

                minHeight: 6,

                backgroundColor: Colors.grey.shade300,

                color: Colors.black,

              ),

            ),

            const SizedBox(height: 20),

            Expanded(

              child: ListView(

                padding: const EdgeInsets.symmetric(horizontal: 22),

                children: [

                  const Text(

                    "HOW WOULD YOU PRIMARILY\nTRAIN?",

                    style: TextStyle(

                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      height: 1.1,

                    ),

                  ),

                  const SizedBox(height: 18),

                  Container(

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color: const Color(0xff6a6464),

                      borderRadius: BorderRadius.circular(14),

                    ),

                    child: const Text(

                      "You can change this setting at any time",

                      style: TextStyle(

                        color: Colors.white,
                        fontSize: 15,

                      ),

                    ),

                  ),

                  const SizedBox(height: 24),

                  optionTile("Full GYM", "assets/images/full_gym.jpg"),

                  optionTile("Dumbbells Only", "assets/images/dumbbells.jpg"),

                  optionTile("Bodyweight only", "assets/images/bodyweight.jpg"),

                  optionTile("Basic equipment", "assets/images/basic_equipment.jpg"),

                  optionTile("Resistance Bands", "assets/images/resistance_band.jpg"),

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

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) => const Goal5Screen(),

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


  /// OPTION TILE (NO OVERFLOW)
  Widget optionTile(String title, String image) {

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedType = title;

        });

      },

      child: Container(

        margin: const EdgeInsets.only(bottom: 14),

        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

        decoration: BoxDecoration(

          color: Colors.grey.shade300,

          borderRadius: BorderRadius.circular(16),

        ),

        child: Row(

          children: [

            Radio(

              value: title,

              groupValue: selectedType,

              onChanged: (value) {

                setState(() {

                  selectedType = value.toString();

                });

              },

              activeColor: Colors.black,

            ),

            const SizedBox(width: 6),

            Expanded(

              child: Text(

                title,

                overflow: TextOverflow.ellipsis,

                style: const TextStyle(

                  fontSize: 16,
                  fontWeight: FontWeight.w500,

                ),

              ),

            ),

            const SizedBox(width: 10),

            ClipRRect(

              borderRadius: BorderRadius.circular(12),

              child: Image.asset(

                image,

                width: 70,
                height: 50,

                fit: BoxFit.cover,

              ),

            ),

          ],

        ),

      ),

    );

  }

}