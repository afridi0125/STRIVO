import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatefulWidget {

  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();

}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {

  final name = TextEditingController();

  final age = TextEditingController();

  final height = TextEditingController();

  final weight = TextEditingController();

  String gender = "Male";

  double bmi = 0;

  void calculateBMI(){

    double h = double.tryParse(height.text) ?? 0;

    double w = double.tryParse(weight.text) ?? 0;

    if(h>0){

      bmi = w / ((h/100)*(h/100));

    }

    setState(() {});

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(title: const Text("Profile Settings")),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          textField(name,"Name"),

          textField(age,"Age"),

          textField(height,"Height (cm)"),

          textField(weight,"Weight (kg)"),

          const SizedBox(height: 10),

          DropdownButtonFormField(

            value: gender,

            items: ["Male","Female","Other"]

                .map((e)=>DropdownMenuItem(value: e,child: Text(e)))

                .toList(),

            onChanged:(v){

              gender = v.toString();

            },

          ),

          const SizedBox(height: 20),

          ElevatedButton(

            onPressed: calculateBMI,

            child: const Text("Calculate BMI"),

          ),

          const SizedBox(height: 10),

          Text("BMI: ${bmi.toStringAsFixed(2)}"),

        ],

      ),

    );

  }

  Widget textField(controller,label){

    return Padding(

      padding: const EdgeInsets.only(bottom: 12),

      child: TextField(

        controller: controller,

        decoration: InputDecoration(

          labelText: label,

          border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(12)),

        ),

      ),

    );

  }

}