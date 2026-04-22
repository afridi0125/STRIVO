import 'package:flutter/material.dart';

class MainMealsListScreen extends StatelessWidget {

  const MainMealsListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("Main Meals")),

      body: const Center(
        child: Text("Meals list coming here"),
      ),

    );

  }

}