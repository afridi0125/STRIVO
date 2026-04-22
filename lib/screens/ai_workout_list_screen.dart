import 'package:flutter/material.dart';

class AiWorkoutListScreen extends StatelessWidget {

  const AiWorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("AI Workouts")),

      body: const Center(child: Text("Full Body AI workouts list here")),

    );

  }

}