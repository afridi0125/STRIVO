import 'package:flutter/material.dart';

class SelfWorkoutListScreen extends StatelessWidget {

  const SelfWorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("Self Guided Workouts")),

      body: const Center(child: Text("Self workouts list here")),

    );

  }

}