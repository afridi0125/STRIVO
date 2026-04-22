import 'package:flutter/material.dart';
import 'workout_detail_screen.dart';

class WorkoutPlanScreen extends StatefulWidget {

  final String workoutName;

  const WorkoutPlanScreen({
    super.key,
    required this.workoutName,
  });

  @override
  State<WorkoutPlanScreen> createState() => _WorkoutPlanScreenState();
}

class _WorkoutPlanScreenState extends State<WorkoutPlanScreen> {

  int selectedWeek = 1;

  int completedDay = 0;

  final int totalDays = 54;

  double get progress => completedDay / totalDays;

  /// workout titles
  List<String> workoutTitles = [

    "Prepared to be Unleashed",
    "Your only job today is to show up",
    "Every rep builds the new you",
    "Discipline beats consistency",
    "Keep pushing forward",
    "One step more than yesterday",
    "Rest & recovery",

  ];

  /// workout images
  List<String> workoutImages = [

    "assets/images/day1.png",
    "assets/images/day2.png",
    "assets/images/day3.png",
    "assets/images/day4.png",
    "assets/images/day5.png",
    "assets/images/day6.png",
    "assets/images/day7_rest.png",

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        title: Text(widget.workoutName),

        centerTitle: true,

      ),

      body: Column(

        children: [

          /// PROGRESS BAR
          Padding(

            padding: const EdgeInsets.all(16),

            child: Column(

              children: [

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    const Text(
                      "Progress",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Text("$completedDay / $totalDays"),

                  ],

                ),

                const SizedBox(height: 8),

                /// animated progress
                TweenAnimationBuilder(

                  duration: const Duration(milliseconds: 500),

                  tween: Tween<double>(
                    begin: 0,
                    end: progress.clamp(0, 1),
                  ),

                  builder: (_, value, __){

                    return LinearProgressIndicator(

                      value: value,

                      minHeight: 6,

                      backgroundColor: Colors.grey.shade300,

                      color: Colors.black,

                    );

                  },

                ),

              ],

            ),

          ),

          /// WEEK SELECTOR
          SizedBox(

            height: 45,

            child: ListView.builder(

              scrollDirection: Axis.horizontal,

              padding: const EdgeInsets.symmetric(horizontal: 16),

              itemCount: 8,

              itemBuilder: (_, index){

                int week = index + 1;

                return Container(

                  margin: const EdgeInsets.only(right: 10),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(

                    color: selectedWeek == week
                        ? Colors.black
                        : Colors.grey.shade200,

                    borderRadius: BorderRadius.circular(20),

                  ),

                  child: Text(

                    "$week",

                    style: TextStyle(

                      color: selectedWeek == week
                          ? Colors.white
                          : Colors.black,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                );

              },

            ),

          ),

          const SizedBox(height: 10),

          /// NEXT WORKOUT CARD
          Container(

            margin: const EdgeInsets.symmetric(horizontal: 16),

            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(

              color: Colors.grey.shade100,

              borderRadius: BorderRadius.circular(16),

            ),

            child: Row(

              children: [

                ClipRRect(

                  borderRadius: BorderRadius.circular(12),

                  child: Image.asset(

                    workoutImages[completedDay % 7],

                    width: 65,
                    height: 65,

                    fit: BoxFit.cover,

                  ),

                ),

                const SizedBox(width: 12),

                Expanded(

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text(

                        "Week $selectedWeek : Day ${completedDay + 1}",

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),

                      ),

                      Text(

                        workoutTitles[completedDay % 7],

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                      ),

                      const Text(

                        "60 MIN : Gym / No Equipment",

                        style: TextStyle(color: Colors.grey),

                      ),

                    ],

                  ),

                ),

              ],

            ),

          ),

          const SizedBox(height: 10),

          /// MOTIVATION TEXT
          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Align(

              alignment: Alignment.centerLeft,

              child: Text(

                "Week $selectedWeek focus. Stay consistent 💪",

                style: const TextStyle(fontStyle: FontStyle.italic),

              ),

            ),

          ),

          const SizedBox(height: 10),

          /// DAY LIST
          Expanded(

            child: ListView.builder(

              padding: const EdgeInsets.all(16),

              itemCount: 7,

              itemBuilder: (_, index){

                int globalDay = ((selectedWeek - 1) * 7) + index;

                bool done = globalDay < completedDay;

                return GestureDetector(

                  onTap: (){

                    /// allow only next day
                    if(globalDay > completedDay) return;

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) => WorkoutDetailScreen(
                            day: globalDay + 1,
                        ),

                      ),

                    ).then((value){

                      if(value == true){

                        setState((){

                          completedDay++;

                          /// auto move week
                          selectedWeek = (completedDay ~/ 7) + 1;

                        });

                      }

                    });

                  },

                  child: Row(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      /// timeline indicator
                      Column(

                        children: [

                          Container(

                            width: 22,
                            height: 22,

                            decoration: BoxDecoration(

                              shape: BoxShape.circle,

                              color: done
                                  ? Colors.orange
                                  : Colors.white,

                              border: Border.all(
                                color: Colors.orange,
                                width: 3,
                              ),

                            ),

                          ),

                          Container(

                            width: 2,
                            height: 80,

                            color: Colors.orange,

                          ),

                        ],

                      ),

                      const SizedBox(width: 12),

                      /// workout card
                      Expanded(

                        child: Container(

                          margin: const EdgeInsets.only(bottom: 16),

                          padding: const EdgeInsets.all(12),

                          decoration: BoxDecoration(

                            color: Colors.grey.shade100,

                            borderRadius: BorderRadius.circular(16),

                          ),

                          child: Row(

                            children: [

                              ClipRRect(

                                borderRadius: BorderRadius.circular(12),

                                child: Image.asset(

                                  workoutImages[index],

                                  width: 60,
                                  height: 60,

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

                                      "Day ${globalDay + 1}",

                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),

                                    ),

                                    Text(

                                      workoutTitles[index],

                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,

                                    ),

                                    const Text(

                                      "60 MIN workout",

                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),

                                    ),

                                  ],

                                ),

                              ),

                            ],

                          ),

                        ),

                      ),

                    ],

                  ),

                );

              },

            ),

          ),

        ],

      ),

    );

  }

}