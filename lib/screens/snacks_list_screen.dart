import 'package:flutter/material.dart';

class SnacksListScreen extends StatelessWidget {

  const SnacksListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("Snacks")),

      body: const Center(child: Text("Snacks list here")),

    );

  }

}