import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WorkoutDetailScreen extends StatefulWidget {

  final int day;

  const WorkoutDetailScreen({
    super.key,
    required this.day,
  });

  @override
  State<WorkoutDetailScreen> createState() =>
      _WorkoutDetailScreenState();

}

class _WorkoutDetailScreenState
    extends State<WorkoutDetailScreen> {

  int? openedIndex;
  VideoPlayerController? controller;

  /// videos only for chest day
  final Map<String,String> videos = {

    "Push-Ups":"assets/videos/Push-Ups.mp4",

    "Barbell Bench Press":
    "assets/videos/Barbell Bench Press.mp4",

    "Incline Dumbbell Press":
    "assets/videos/Incline Dumbbell Press.mp4",

    "Cable Chest Fly":
    "assets/videos/Machine Chest Fly.mp4",

    "Parallel Bar Dips":
    "assets/videos/Parallel Bar Dips.mp4",

    "Rope Tricep Pushdown":
    "assets/videos/Rope Tricep Pushdown.mp4",

  };

  /// MASTER EXERCISE BANK
  final List<Map<String,String>> weeklyFocus = [

    {"title":"Chest & Triceps","target":"Chest"},
    {"title":"Back & Biceps","target":"Back"},
    {"title":"Leg Strength","target":"Legs"},
    {"title":"Shoulder Builder","target":"Shoulders"},
    {"title":"Core Power","target":"Abs"},
    {"title":"Full Body HIIT","target":"Full Body"},
    {"title":"Recovery Mobility","target":"Stretch"}

  ];

  /// warmups
  final List<String> warmups = [
    "Jumping Jacks",
    "Arm Circles",
    "Hip Rotation",
    "Leg Swing",
    "High Knees",
    "Torso Twist",
    "Light Jog",
    "Shoulder Rolls",
    "Ankle Rotation",
    "Side Bends"
  ];

  /// cooldowns
  final List<String> cooldowns = [
    "Hamstring Stretch",
    "Quad Stretch",
    "Child Pose",
    "Cobra Stretch",
    "Shoulder Stretch",
    "Neck Stretch",
    "Back Stretch",
    "Deep Breathing",
    "Forward Fold",
    "Hip Flexor Stretch"
  ];

  /// main workouts bank
  final List<List<String>> workoutsBank = [

    /// chest
    [
      "Push-Ups",
      "Barbell Bench Press",
      "Incline Dumbbell Press",
      "Cable Chest Fly",
      "Parallel Bar Dips"
    ],

    /// back
    [
      "Pull Ups",
      "Lat Pulldown",
      "Seated Row",
      "Deadlift",
      "Face Pull"
    ],

    /// legs
    [
      "Squats",
      "Lunges",
      "Leg Press",
      "Calf Raise",
      "Glute Bridge"
    ],

    /// shoulder
    [
      "Shoulder Press",
      "Lateral Raise",
      "Front Raise",
      "Arnold Press",
      "Reverse Fly"
    ],

    /// core
    [
      "Plank",
      "Crunches",
      "Leg Raise",
      "Russian Twist",
      "Mountain Climbers"
    ],

    /// hiit
    [
      "Burpees",
      "Jump Squat",
      "High Knees",
      "Pushups",
      "Mountain Climbers"
    ],

    /// recovery
    [
      "Yoga Stretch",
      "Deep Breathing",
      "Foam Rolling",
      "Mobility Flow",
      "Relax Walk"
    ],

  ];

  /// generate workout dynamically
  Map<String,dynamic> generateWorkout(int day){

    int week = ((day-1)/7).floor();

    int focusIndex = (day-1)%7;

    List<String> warm = List.generate(
        5,
            (i)=> warmups[(i+week)%warmups.length]
    );

    List<String> main = workoutsBank[focusIndex];

    List<String> cool = List.generate(
        5,
            (i)=> cooldowns[(i+week)%cooldowns.length]
    );

    return {

      "title":"Week ${week+1} - ${weeklyFocus[focusIndex]["title"]}",

      "target":weeklyFocus[focusIndex]["target"],

      "warmup":warm,

      "workout":main,

      "cooldown":cool

    };

  }

  /// play video
  Future playVideo(String name,int index) async {

    if(!videos.containsKey(name)) return;

    try{

      if(controller!=null){

        await controller!.pause();
        await controller!.dispose();

      }

      controller =
          VideoPlayerController.asset(videos[name]!);

      await controller!.initialize();

      setState(()=>openedIndex=index);

      controller!.play();

    }

    catch(e){

      print("VIDEO ERROR $e");

    }

  }

  @override
  void dispose(){

    controller?.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context){

    final data = generateWorkout(widget.day);

    return Scaffold(

      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(

        title: Text("DAY ${widget.day}"),

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          Image.asset(
            "assets/images/workout_cover.png",
            height: 200,
            fit: BoxFit.cover,
          ),

          const SizedBox(height:20),

          const Text("AI COACHED"),

          Text(
            data["title"],
            style: const TextStyle(
              fontSize:22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height:20),

          infoCard(data["target"]),

          const SizedBox(height:20),

          quoteCard(),

          const SizedBox(height:20),

          section("WARM-UP",data["warmup"],false),

          const SizedBox(height:20),

          section("THE WORKOUT",data["workout"],true),

          const SizedBox(height:20),

          section("COOL DOWN",data["cooldown"],false),

          const SizedBox(height:30),

          startButton()

        ],

      ),

    );

  }

  Widget quoteCard(){

    return Container(

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

      ),

      child: const Text(

        "Train consistently. Progress weekly. Unlock peak performance.",

      ),

    );

  }

  Widget infoCard(String target){

    return Container(

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

      ),

      child: Column(

        children: [

          row("LEVEL","ALL"),

          row("TIME","60 MIN"),

          row("TARGET",target),

          row("EQUIPMENT","GYM"),

        ],

      ),

    );

  }

  Widget section(String title,List list,bool allowVideo){

    return Container(

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(

            title,

            style: const TextStyle(

              fontWeight: FontWeight.bold,

            ),

          ),

          const Divider(),

          ...list.asMap().entries.map((entry){

            int index = entry.key;

            String name = entry.value;

            return Column(

              children: [

                ListTile(

                  title: Text(name),

                  trailing:

                  allowVideo && videos.containsKey(name)

                      ?

                  IconButton(

                    icon: Icon(

                      openedIndex==index

                          ? Icons.keyboard_arrow_up

                          : Icons.keyboard_arrow_down,

                    ),

                    onPressed: (){

                      if(openedIndex==index){

                        controller?.pause();

                        setState(()=>openedIndex=null);

                      }

                      else{

                        playVideo(name,index);

                      }

                    },

                  )

                      :

                  const Text("00:30"),

                ),

                if(allowVideo &&
                    openedIndex==index &&
                    controller!=null &&
                    controller!.value.isInitialized)

                  Container(

                    height:170,

                    margin: const EdgeInsets.only(bottom:10),

                    child: ClipRRect(

                      borderRadius: BorderRadius.circular(12),

                      child: AspectRatio(

                        aspectRatio:
                        controller!.value.aspectRatio,

                        child: VideoPlayer(controller!),

                      ),

                    ),

                  )

              ],

            );

          })

        ],

      ),

    );

  }

  Widget startButton(){

    return ElevatedButton(

      style: ElevatedButton.styleFrom(

        backgroundColor: Colors.black,

        minimumSize:
        const Size(double.infinity,55),

      ),

      onPressed: (){

        Navigator.pop(context,true);

      },

      child: const Text(

        "COMPLETE WORKOUT",

        style: TextStyle(

          color: Colors.yellow,

          fontWeight: FontWeight.bold,

        ),

      ),

    );

  }

  Widget row(String l,String r){

    return Padding(

      padding:
      const EdgeInsets.symmetric(vertical:8),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: [

          Text(l),

          Text(

            r,

            style: const TextStyle(

              fontWeight: FontWeight.bold,

            ),

          ),

        ],

      ),

    );

  }

}