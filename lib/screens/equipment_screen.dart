import 'package:flutter/material.dart';

class EquipmentScreen extends StatefulWidget {

  static List<String> selectedEquipment = [];

  const EquipmentScreen({super.key});

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();

}

class _EquipmentScreenState extends State<EquipmentScreen> {

  List<String> items = [

    "Full Gym",

    "Dumbbells",

    "Resistance Band",

    "Bodyweight",

    "Yoga Mat",

  ];

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(title: const Text("Select Equipment")),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: items.map((e){

          return CheckboxListTile(

            value: EquipmentScreen.selectedEquipment.contains(e),

            title: Text(e),

            onChanged:(v){

              setState((){

                v!

                    ? EquipmentScreen.selectedEquipment.add(e)

                    : EquipmentScreen.selectedEquipment.remove(e);

              });

            },

          );

        }).toList(),

      ),

    );

  }

}