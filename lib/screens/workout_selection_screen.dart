import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/session_service.dart';

import 'home_screen.dart';
import 'calendar_screen.dart';
import 'workout_plan_screen.dart';

class WorkoutSelectionScreen extends StatefulWidget {

  const WorkoutSelectionScreen({super.key});

  @override
  State<WorkoutSelectionScreen> createState() => _WorkoutSelectionScreenState();

}

class _WorkoutSelectionScreenState extends State<WorkoutSelectionScreen> {

  String selectedWorkout = "";

  File? profileImage;

  final ImagePicker picker = ImagePicker();

  /// pick profile image
  Future pickImage() async {

    final XFile? image =
    await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {

      setState(() {

        profileImage = File(image.path);

      });

    }

  }

  /// SELECT WORKOUT → SAVE → HOME
  Future goToHome() async {

    if(selectedWorkout.isEmpty){

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text("Please select workout first"),
        ),

      );

      return;

    }

    /// SAVE WORKOUT
    await SessionService.saveWorkout(selectedWorkout);

    /// SAVE GOAL COMPLETED
    await SessionService.setGoalCompleted(true);

    Navigator.pushReplacement(

      context,

      MaterialPageRoute(

        builder: (_) => HomeScreen(
          selectedWorkout: selectedWorkout,
        ),

      ),

    );

  }

  /// REVIEW PLAN
  void reviewWorkout(){

    if(selectedWorkout.isEmpty){

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text("Please select workout first"),
        ),

      );

      return;

    }

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) => WorkoutPlanScreen(
          workoutName: selectedWorkout,
        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            /// PROFILE
            Row(

              children: [

                GestureDetector(

                  onTap: pickImage,

                  child: CircleAvatar(

                    radius: 26,

                    backgroundImage:

                    profileImage != null

                        ? FileImage(profileImage!)

                        : const AssetImage(
                        "assets/images/profile.jpg"
                    ) as ImageProvider,

                  ),

                ),

                const SizedBox(width: 12),

                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Text(

                      "Hello User!",

                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),

                    ),

                    const SizedBox(height: 2),

                    GestureDetector(

                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) => CalendarScreen(),

                          ),

                        );

                      },

                      child: const Text(

                        "Today",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),

                      ),

                    ),

                  ],

                ),

              ],

            ),

            const SizedBox(height: 30),

            /// TITLE
            const Text(

              "CHOOSE YOUR IDEAL\nACTIVITIES",

              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),

            ),

            const SizedBox(height: 10),

            const Text(

              "Choose your fitness journey — gym strength, yoga flexibility, or sports stamina.",

              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),

            ),

            const SizedBox(height: 20),

            workoutCard(
              title: "Strivo Unleashed : Beginner",
              image: "assets/images/beginner.jpg",
              tags: ["8 weeks", "Body Weight", "Low Impact"],
            ),

            workoutCard(
              title: "Strivo Unleashed : Intermediate",
              image: "assets/images/intermediate.jpg",
              tags: ["8 weeks", "Body Weight", "Light Impact"],
            ),

            workoutCard(
              title: "Strivo Unleashed : Expert",
              image: "assets/images/expert.jpg",
              tags: ["8 weeks", "Gym", "High Impact"],
            ),

            workoutCard(
              title: "Strivo Unleashed : Sports",
              image: "assets/images/sports.jpg",
              tags: ["Indian Sports", "Body Strength"],
            ),

            workoutCard(
              title: "Strivo Unleashed : Yoga",
              image: "assets/images/yoga.jpg",
              tags: ["Relax", "Stretch"],
            ),

            const SizedBox(height: 30),

            /// REVIEW + SELECT BUTTONS
            Row(

              children: [

                Expanded(

                  child: OutlinedButton(

                    style: OutlinedButton.styleFrom(

                      padding:
                      const EdgeInsets.symmetric(vertical:14),

                      side:
                      const BorderSide(color: Colors.black),

                    ),

                    onPressed: reviewWorkout,

                    child: const Text(

                      "Review",

                      style: TextStyle(

                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                ),

                const SizedBox(width: 12),

                Expanded(

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.black,

                      padding:
                      const EdgeInsets.symmetric(vertical:14),

                    ),

                    onPressed: goToHome,

                    child: const Text(

                      "Select",

                      style: TextStyle(

                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                ),

              ],

            ),

            const SizedBox(height: 40),

          ],

        ),

      ),

    );

  }

  /// WORKOUT CARD
  Widget workoutCard({

    required String title,
    required String image,
    required List<String> tags,

  }) {

    bool isSelected = selectedWorkout == title;

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedWorkout = title;

        });

      },

      child: Container(

        margin: const EdgeInsets.only(bottom:18),

        height: 210,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),

          border: isSelected

              ? Border.all(color: Colors.black, width: 3)

              : null,

          image: DecorationImage(

            image: AssetImage(image),

            fit: BoxFit.cover,

          ),

        ),

        child: Container(

          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),

            gradient: LinearGradient(

              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,

              colors: [

                Colors.black.withOpacity(.75),
                Colors.transparent,

              ],

            ),

          ),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.end,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                title,

                style: const TextStyle(

                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,

                ),

              ),

              const SizedBox(height: 6),

              Wrap(

                spacing: 8,

                children: tags.map((tag) {

                  return Container(

                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),

                    decoration: BoxDecoration(

                      color: const Color(0xff8bd3dd),

                      borderRadius:
                      BorderRadius.circular(20),

                    ),

                    child: Text(

                      tag,

                      style: const TextStyle(

                        fontSize: 12,
                        fontWeight: FontWeight.w600,

                      ),

                    ),

                  );

                }).toList(),

              ),

            ],

          ),

        ),

      ),

    );

  }

}