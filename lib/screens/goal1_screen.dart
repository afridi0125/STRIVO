import 'package:flutter/material.dart';
import 'goal2_screen.dart';

class Goal1Screen extends StatefulWidget {
  const Goal1Screen({super.key});

  @override
  State<Goal1Screen> createState() => _Goal1ScreenState();
}

class _Goal1ScreenState extends State<Goal1Screen> {

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();

  String gender = "";

  bool isFilled = false;

  void checkFields() {

    setState(() {

      isFilled =
          firstName.text.isNotEmpty &&
              lastName.text.isNotEmpty &&
              height.text.isNotEmpty &&
              weight.text.isNotEmpty &&
              gender.isNotEmpty;

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: Column(

          children: [

            /// TOP BAR
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

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
                    "Step 1 to 7",
                    style: TextStyle(fontSize: 16),
                  )

                ],

              ),

            ),

            /// PROGRESS BAR
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: LinearProgressIndicator(

                value: 1/7,

                minHeight: 6,

                backgroundColor: Colors.grey.shade300,

                color: Colors.black,

              ),

            ),

            const SizedBox(height: 18),

            Expanded(

              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal: 22),

                child: ListView(

                  children: [

                    /// TITLE
                    const Text(

                      "FIRST THINGS FIRST:\nLET’S GET TO KNOW YOU",

                      style: TextStyle(

                        fontSize: 26,

                        fontWeight: FontWeight.w900,

                        height: 1.1,

                        letterSpacing: 0.2,

                      ),

                    ),

                    const SizedBox(height: 28),

                    /// FIRST NAME
                    const Text("First Name"),

                    const SizedBox(height: 6),

                    inputBox(firstName),

                    const SizedBox(height: 18),

                    /// LAST NAME
                    const Text("Last Name"),

                    const SizedBox(height: 6),

                    inputBox(lastName),

                    const SizedBox(height: 18),

                    /// HEIGHT
                    const Text("Height (cm)"),

                    const SizedBox(height: 6),

                    inputBox(height),

                    const SizedBox(height: 18),

                    /// WEIGHT
                    const Text("Weight (kg)"),

                    const SizedBox(height: 6),

                    inputBox(weight),

                    const SizedBox(height: 18),

                    /// GENDER
                    const Text("Your Sex"),

                    const SizedBox(height: 10),

                    genderBox("Male"),

                    genderBox("Female"),

                  ],

                ),

              ),

            ),

            /// CONTINUE BUTTON
            Padding(

              padding: const EdgeInsets.all(20),

              child: SizedBox(

                width: double.infinity,

                height: 55,

                child: ElevatedButton(

                  onPressed: isFilled
                      ? () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) => const Goal2Screen(),

                      ),

                    );

                  }
                      : null,

                  style: ElevatedButton.styleFrom(

                    backgroundColor: isFilled
                        ? Colors.black
                        : Colors.grey.shade300,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(12),

                    ),

                  ),

                  child: Text(

                    "CONTINUE",

                    style: TextStyle(

                      color: isFilled
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

  /// INPUT FIELD
  Widget inputBox(TextEditingController controller) {

    return TextField(

      controller: controller,

      onChanged: (v) => checkFields(),

      decoration: InputDecoration(

        filled: true,

        fillColor: Colors.grey.shade300,

        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(12),

          borderSide: BorderSide.none,

        ),

      ),

    );

  }

  /// RADIO BUTTON STYLE
  Widget genderBox(String value) {

    return Container(

      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.symmetric(horizontal: 12),

      decoration: BoxDecoration(

        color: Colors.grey.shade300,

        borderRadius: BorderRadius.circular(12),

      ),

      child: RadioListTile(

        value: value,

        groupValue: gender,

        onChanged: (val) {

          setState(() {

            gender = val.toString();

          });

          checkFields();

        },

        activeColor: Colors.black,

        title: Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),

        contentPadding: EdgeInsets.zero,

      ),

    );

  }

}