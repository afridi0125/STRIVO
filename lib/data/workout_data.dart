class Exercise {

  final String name;

  final String video;

  final List<String> equipment;

  Exercise({

    required this.name,

    required this.video,

    required this.equipment,

  });

}

Map<int,List<Exercise>> workoutDatabase = {

  1: [

    Exercise(
      name: "Push Ups",
      video: "assets/videos/pushup.mp4",
      equipment: ["Bodyweight"],
    ),

    Exercise(
      name: "Dumbbell Press",
      video: "assets/videos/dumbbell_press.mp4",
      equipment: ["Dumbbells"],
    ),

    Exercise(
      name: "Resistance Band Chest",
      video: "assets/videos/band_chest.mp4",
      equipment: ["Resistance Band"],
    ),

  ],

  2: [

    Exercise(
      name: "Squats",
      video: "assets/videos/squat.mp4",
      equipment: ["Bodyweight"],
    ),

    Exercise(
      name: "Dumbbell Squat",
      video: "assets/videos/dumbbell_squat.mp4",
      equipment: ["Dumbbells"],
    ),

  ],

};