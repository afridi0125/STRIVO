import 'package:flutter/material.dart';

import '../widgets/bottom_menu_bar.dart';

import 'ai_workout_list_screen.dart';
import 'self_workout_list_screen.dart';
import 'main_meals_list_screen.dart';
import 'snacks_list_screen.dart';
import 'yoga_list_screen.dart';

import 'home_screen.dart';
import 'health_screen.dart';
import 'profile_screen.dart';

class DiscoveryScreen extends StatefulWidget {

  final String selectedWorkout;

  const DiscoveryScreen({
    super.key,
    required this.selectedWorkout,
  });

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();

}

class _DiscoveryScreenState extends State<DiscoveryScreen> {

  int selectedIndex = 1;

  /// GLOBAL MENU NAVIGATION
  void changeTab(int index){

    if(index == selectedIndex) return;

    if(index == 0){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(
            selectedWorkout: widget.selectedWorkout,
          ),
        ),
      );

    }

    if(index == 1){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DiscoveryScreen(
            selectedWorkout: widget.selectedWorkout,
          ),
        ),
      );

    }

    if(index == 2){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HealthScreen(
            selectedWorkout: widget.selectedWorkout,
          ),
        ),
      );

    }

    if(index == 3){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ProfileScreen(
            selectedWorkout: widget.selectedWorkout,
          ),
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      bottomNavigationBar: BottomMenuBar(

        selectedIndex: selectedIndex,
        onTap: changeTab,

      ),

      body: SafeArea(

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            const Text(

              "DISCOVERY",

              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 25),

            /// FITNESS
            sectionTitle(
              icon: Icons.directions_run,
              title: "FITNESS",
              color: const Color(0xff7bb3b8),
            ),

            const SizedBox(height: 20),

            discoveryCard(
              title: "AI Coached Workouts",
              image: "assets/images/intermediate.jpg",
              color: const Color(0xff6aa6ab),

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AiWorkoutListScreen(),
                  ),
                );
              },
            ),

            discoveryCard(
              title: "Self Guided Workouts",
              image: "assets/images/bodyweight.jpg",
              color: const Color(0xff6aa6ab),

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SelfWorkoutListScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            /// MEALS
            sectionTitle(
              icon: Icons.restaurant,
              title: "MEALS",
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            discoveryCard(
              title: "Main Meals",
              image: "assets/images/meal.jpg",
              color: Colors.orange,

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MainMealsListScreen(),
                  ),
                );
              },
            ),

            discoveryCard(
              title: "Snacks",
              image: "assets/images/meal3.jpg",
              color: Colors.orange,

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SnacksListScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            /// BODY
            sectionTitle(
              icon: Icons.self_improvement,
              title: "BODY",
              color: const Color(0xffd8b07a),
            ),

            const SizedBox(height: 20),

            discoveryCard(
              title: "Yoga & Stretching",
              image: "assets/images/yoga.jpg",
              color: const Color(0xffd8b07a),

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const YogaListScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

          ],

        ),

      ),

    );

  }

  /// SECTION HEADER
  Widget sectionTitle({

    required IconData icon,
    required String title,
    required Color color,

  }){

    return Row(

      children: [

        Container(

          padding: const EdgeInsets.all(12),

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Icon(icon),

        ),

        const SizedBox(width: 12),

        Text(

          title,

          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),

        ),

      ],

    );

  }

  /// CARD
  Widget discoveryCard({

    required String title,
    required String image,
    required Color color,
    required VoidCallback onTap,

  }){

    return GestureDetector(

      onTap: onTap,

      child: Container(

        margin: const EdgeInsets.only(bottom: 18),

        height: 110,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Row(

          children: [

            ClipRRect(

              borderRadius: BorderRadius.circular(18),

              child: Image.asset(
                image,
                width: 120,
                height: 110,
                fit: BoxFit.cover,
              ),

            ),

            const SizedBox(width: 20),

            Expanded(

              child: Row(

                children: [

                  Expanded(

                    child: Text(
                      title,

                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),

                    ),

                  ),

                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.black,
                  ),

                  const SizedBox(width: 10),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}