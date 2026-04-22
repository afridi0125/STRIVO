import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/bottom_menu_bar.dart';

import 'workout_plan_screen.dart';
import 'meal_detail_screen.dart';
import 'yoga_list_screen.dart';
import 'calendar_screen.dart';
import 'discovery_screen.dart';
import 'health_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {

  final String selectedWorkout;

  const HomeScreen({
    super.key,
    required this.selectedWorkout,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  int completedDays = 0;

  double get progress => completedDays / 54;

  String username = "User";

  @override
  void initState() {

    super.initState();

    final user = FirebaseAuth.instance.currentUser;

    if(user != null){

      username =
          user.displayName ??
              user.email?.split("@")[0] ??
              "User";

    }

  }

  /// bottom navigation
  void changeTab(int index){

    if(index == selectedIndex) return;

    if(index == 1){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              DiscoveryScreen(
                selectedWorkout:
                widget.selectedWorkout,
              ),
        ),
      );

    }

    if(index == 2){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              HealthScreen(
                selectedWorkout:
                widget.selectedWorkout,
              ),
        ),
      );

    }

    if(index == 3){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ProfileScreen(
                selectedWorkout:
                widget.selectedWorkout,
              ),
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xfff5f5f5),

      body: SafeArea(

        child: Column(

          children: [

            Expanded(

              child: ListView(

                padding:
                const EdgeInsets.all(20),

                children: [

                  /// profile + date
                  Row(

                    children: [

                      GestureDetector(

                        onTap: (){

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (_) =>
                                  ProfileScreen(
                                    selectedWorkout:
                                    widget.selectedWorkout,
                                  ),

                            ),

                          );

                        },

                        child: const CircleAvatar(

                          radius: 24,

                          backgroundImage:

                          AssetImage(
                              "assets/images/profile.jpg"
                          ),

                        ),

                      ),

                      const SizedBox(width: 12),

                      GestureDetector(

                        onTap: (){

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (_) =>
                                  CalendarScreen(),

                            ),

                          );

                        },

                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(

                              "Hello $username 👋",

                              style:
                              const TextStyle(
                                  color: Colors.grey
                              ),

                            ),

                            const Text(

                              "Today",

                              style: TextStyle(

                                fontSize: 18,
                                fontWeight:
                                FontWeight.bold,

                              ),

                            ),

                          ],

                        ),

                      ),

                    ],

                  ),

                  const SizedBox(height: 20),

                  /// home title
                  const Text(

                    "HOME",

                    style: TextStyle(

                      fontSize: 22,
                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height: 20),

                  /// workout title
                  const Row(

                    children: [

                      Icon(Icons.fitness_center),

                      SizedBox(width: 6),

                      Text(

                        "WORKOUT",

                        style: TextStyle(
                            fontWeight:
                            FontWeight.bold
                        ),

                      ),

                    ],

                  ),

                  const SizedBox(height: 10),

                  /// workout card
                  GestureDetector(

                    onTap: (){

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) =>
                              WorkoutPlanScreen(
                                workoutName:
                                widget.selectedWorkout,
                              ),

                        ),

                      ).then((value){

                        if(value != null){

                          setState((){

                            completedDays =
                                value;

                          });

                        }

                      });

                    },

                    child: Container(

                      height: 180,

                      decoration:
                      BoxDecoration(

                        borderRadius:
                        BorderRadius.circular(20),

                        image:
                        DecorationImage(

                          image:
                          AssetImage(
                              getWorkoutImage()
                          ),

                          fit: BoxFit.cover,

                        ),

                      ),

                      child: Container(

                        padding:
                        const EdgeInsets.all(16),

                        decoration:
                        BoxDecoration(

                          borderRadius:
                          BorderRadius.circular(20),

                          gradient:
                          LinearGradient(

                            begin:
                            Alignment.bottomCenter,

                            end:
                            Alignment.topCenter,

                            colors: [

                              Colors.black
                                  .withOpacity(.7),

                              Colors.transparent,

                            ],

                          ),

                        ),

                        child: Column(

                          mainAxisAlignment:
                          MainAxisAlignment.end,

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(

                              widget.selectedWorkout,

                              style:
                              const TextStyle(

                                color:
                                Colors.white,

                                fontSize: 18,

                                fontWeight:
                                FontWeight.bold,

                              ),

                            ),

                            const SizedBox(height: 6),

                            Text(

                              "$completedDays/54",

                              style:
                              const TextStyle(
                                  color:
                                  Colors.white
                              ),

                            ),

                            const SizedBox(height: 6),

                            const Text(

                              "Tap to continue",

                              style:
                              TextStyle(
                                  color:
                                  Colors.white70
                              ),

                            ),

                            const SizedBox(height: 8),

                            LinearProgressIndicator(

                              value:
                              progress.clamp(0,1),

                              backgroundColor:

                              Colors.white
                                  .withOpacity(.3),

                              color: Colors.white,

                            ),

                          ],

                        ),

                      ),

                    ),

                  ),

                  const SizedBox(height: 16),

                  /// yoga
                  GestureDetector(

                    onTap: (){

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) =>
                          const YogaListScreen(),

                        ),

                      );

                    },

                    child: Container(

                      height: 110,

                      decoration:
                      BoxDecoration(

                        borderRadius:
                        BorderRadius.circular(18),

                        image:
                        const DecorationImage(

                          image:
                          AssetImage(
                              "assets/images/yoga.jpg"
                          ),

                          fit: BoxFit.cover,

                        ),

                      ),

                      child: Container(

                        padding:
                        const EdgeInsets.all(14),

                        decoration:
                        BoxDecoration(

                          borderRadius:
                          BorderRadius.circular(18),

                          gradient:
                          LinearGradient(

                            begin:
                            Alignment.bottomCenter,

                            end:
                            Alignment.topCenter,

                            colors: [

                              Colors.black
                                  .withOpacity(.6),

                              Colors.transparent,

                            ],

                          ),

                        ),

                        child: const Column(

                          mainAxisAlignment:
                          MainAxisAlignment.end,

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(

                              "Yoga Stretch",

                              style: TextStyle(

                                color: Colors.white,
                                fontWeight:
                                FontWeight.bold,

                              ),

                            ),

                            Text(

                              "30 MIN",

                              style:
                              TextStyle(
                                  color:
                                  Colors.white70
                              ),

                            ),

                          ],

                        ),

                      ),

                    ),

                  ),

                  const SizedBox(height: 20),

                  /// meals title
                  const Row(

                    children: [

                      Icon(Icons.restaurant),

                      SizedBox(width: 6),

                      Text(

                        "MEALS",

                        style: TextStyle(
                            fontWeight:
                            FontWeight.bold
                        ),

                      ),

                    ],

                  ),

                  const SizedBox(height: 10),

                  mealTile(

                    "Blueberry yogurt & dry fruits",

                    "Breakfast",

                    "assets/images/meal1.jpg",

                  ),

                  mealTile(

                    "Brown Rice Dal & Paneer",

                    "Lunch",

                    "assets/images/meal2.jpg",

                  ),

                  mealTile(

                    "Banana blueberry shake",

                    "Post workout",

                    "assets/images/meal3.jpg",

                  ),

                  mealTile(

                    "Grilled chicken & rice",

                    "Dinner",

                    "assets/images/meal4.jpg",

                  ),

                  const SizedBox(height: 20),

                  /// sports
                  const Row(

                    children: [

                      Icon(Icons.sports_cricket),

                      SizedBox(width: 6),

                      Text(

                        "SPORTS",

                        style: TextStyle(
                            fontWeight:
                            FontWeight.bold
                        ),

                      ),

                    ],

                  ),

                  const SizedBox(height: 10),

                  mealTile(

                    "Cricket Training",

                    "45 MIN",

                    "assets/images/cricket.jpg",

                  ),

                ],

              ),

            ),

            BottomMenuBar(

              selectedIndex: selectedIndex,

              onTap: changeTab,

            ),

          ],

        ),

      ),

    );

  }

  /// workout image
  String getWorkoutImage(){

    if(widget.selectedWorkout.contains("Beginner")){
      return "assets/images/beginner.jpg";
    }

    if(widget.selectedWorkout.contains("Intermediate")){
      return "assets/images/intermediate.jpg";
    }

    if(widget.selectedWorkout.contains("Expert")){
      return "assets/images/expert.jpg";
    }

    if(widget.selectedWorkout.contains("Sports")){
      return "assets/images/sports.jpg";
    }

    return "assets/images/yoga.jpg";

  }

  /// meal tile
  Widget mealTile(

      String title,
      String subtitle,
      String image

      ){

    return GestureDetector(

      onTap: (){

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) =>
                MealDetailScreen(

                  title: title,

                  image: image,

                ),

          ),

        );

      },

      child: Container(

        margin:
        const EdgeInsets.only(bottom: 12),

        padding:
        const EdgeInsets.all(10),

        decoration:
        BoxDecoration(

          color: Colors.white,

          borderRadius:
          BorderRadius.circular(18),

        ),

        child: Row(

          children: [

            ClipRRect(

              borderRadius:
              BorderRadius.circular(14),

              child: Image.asset(

                image,

                width: 70,
                height: 70,

                fit: BoxFit.cover,

              ),

            ),

            const SizedBox(width: 12),

            Expanded(

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    title,

                    style: const TextStyle(
                        fontWeight:
                        FontWeight.bold
                    ),

                  ),

                  Text(subtitle),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}