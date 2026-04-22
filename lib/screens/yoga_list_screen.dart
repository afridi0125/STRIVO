import 'package:flutter/material.dart';

class YogaListScreen extends StatelessWidget {

  const YogaListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Yoga Workouts"),

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          yogaTile("Morning Stretch", "30 MIN"),

          yogaTile("Flexibility Flow", "30 MIN"),

          yogaTile("Relax & Breathe", "30 MIN"),

        ],

      ),

    );

  }

  Widget yogaTile(String title, String duration) {

    return Container(

      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(

        color: Colors.grey.shade200,

        borderRadius: BorderRadius.circular(14),

      ),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Text(

            title,

            style: const TextStyle(

              fontWeight: FontWeight.bold,

            ),

          ),

          Text(duration),

        ],

      ),

    );

  }

}