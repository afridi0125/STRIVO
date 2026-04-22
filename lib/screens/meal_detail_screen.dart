import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {

  final String title;
  final String image;

  const MealDetailScreen({

    super.key,
    required this.title,
    required this.image,

  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(title),

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          ClipRRect(

            borderRadius: BorderRadius.circular(16),

            child: Image.asset(image),

          ),

          const SizedBox(height: 20),

          const Text(

            "Calories: 420 kcal",

            style: TextStyle(

              fontSize: 16,
              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          const Text(

            "Protein: 18g",

            style: TextStyle(fontSize: 16),

          ),

          const SizedBox(height: 20),

          const Text(

            "Preparation",

            style: TextStyle(

              fontSize: 18,
              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 10),

          const Text(

            "1. Prepare ingredients\n"
                "2. Mix properly\n"
                "3. Cook for 10 minutes\n"
                "4. Serve fresh",

          ),

        ],

      ),

    );

  }

}