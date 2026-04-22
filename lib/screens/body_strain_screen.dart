import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BodyStrainScreen extends StatefulWidget {

  const BodyStrainScreen({super.key});

  @override
  State<BodyStrainScreen> createState() => _BodyStrainScreenState();

}

class _BodyStrainScreenState extends State<BodyStrainScreen> {

  bool isFront = true;

  bool isMale = true;

  File? image;

  final picker = ImagePicker();

  Map<String,int> strainData = {};

  /// choose correct muscle image
  String get muscleImage {

    if(isMale && isFront) {
      return "assets/images/male_front.png";
    }

    if(isMale && !isFront) {
      return "assets/images/male_back.png";
    }

    if(!isMale && isFront) {
      return "assets/images/female_front.png";
    }

    return "assets/images/female_back.png";

  }

  /// pick workout image
  Future pickImage() async {

    final img = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if(img==null) return;

    image = File(img.path);

    generateStrain();

    setState(() {});

  }

  /// demo strain calculation
  void generateStrain(){

    Random r = Random();

    if(isFront){

      strainData = {

        "Chest": 40+r.nextInt(20),

        "Core": 60+r.nextInt(25),

        "Shoulders": 30+r.nextInt(20),

        "Arms": 30+r.nextInt(20),

        "Quads": 50+r.nextInt(20),

        "Legs": 10+r.nextInt(20),

      };

    }

    else{

      strainData = {

        "Back": 40+r.nextInt(20),

        "Triceps": 60+r.nextInt(20),

        "Shoulders": 30+r.nextInt(20),

        "Glutes": 50+r.nextInt(20),

        "Hamstring": 30+r.nextInt(20),

        "Calf": 10+r.nextInt(20),

      };

    }

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(

        title: const Text("BODY STRAIN"),

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          /// gender toggle
          genderToggle(),

          const SizedBox(height:10),

          /// muscle image
          Container(

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius: BorderRadius.circular(20),

            ),

            child: Column(

              children: [

                Image.asset(

                  muscleImage,

                  height: 300,

                ),

                const SizedBox(height:20),

                frontBackToggle(),

              ],

            ),

          ),

          const SizedBox(height:20),

          /// upload section
          Container(

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius: BorderRadius.circular(20),

            ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Text(

                  "Post Workout Scan",

                  style: TextStyle(

                      fontWeight: FontWeight.bold),

                ),

                const SizedBox(height:10),

                ElevatedButton(

                  onPressed: pickImage,

                  child: const Text("Upload workout image"),

                ),

                if(image!=null)

                  Padding(

                    padding: const EdgeInsets.only(top:12),

                    child: Image.file(image!,height:120),

                  ),

              ],

            ),

          ),

          const SizedBox(height:20),

          /// graph result
          if(strainData.isNotEmpty)

            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.circular(20),

              ),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Text(

                    "Muscle Load",

                    style: TextStyle(

                        fontWeight: FontWeight.bold),

                  ),

                  const SizedBox(height:20),

                  ...strainData.entries.map(

                        (e)=> strainBar(e.key,e.value),

                  ),

                  const SizedBox(height:10),

                  Text(

                    "Total Body Load: ${avg()}%",

                    style: const TextStyle(

                        fontWeight: FontWeight.bold),

                  )

                ],

              ),

            ),

        ],

      ),

    );

  }

  /// male female toggle
  Widget genderToggle(){

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        ChoiceChip(

          label: const Text("Male"),

          selected: isMale,

          onSelected: (v){

            setState(()=>isMale=true);

          },

        ),

        const SizedBox(width:10),

        ChoiceChip(

          label: const Text("Female"),

          selected: !isMale,

          onSelected: (v){

            setState(()=>isMale=false);

          },

        ),

      ],

    );

  }

  /// front back toggle
  Widget frontBackToggle(){

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        ChoiceChip(

          label: const Text("Front"),

          selected: isFront,

          onSelected: (v){

            setState((){

              isFront=true;

              image=null;

              strainData={};

            });

          },

        ),

        const SizedBox(width:10),

        ChoiceChip(

          label: const Text("Back"),

          selected: !isFront,

          onSelected: (v){

            setState((){

              isFront=false;

              image=null;

              strainData={};

            });

          },

        ),

      ],

    );

  }

  /// strain bar
  Widget strainBar(String muscle,int value){

    Color c = Colors.green;

    if(value>75) c = Colors.red;

    else if(value>60) c = Colors.orange;

    else if(value>40) c = Colors.yellow;

    else if(value>25) c = Colors.blue;

    return Padding(

      padding: const EdgeInsets.only(bottom:12),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text("$muscle : $value%"),

          const SizedBox(height:4),

          LinearProgressIndicator(

            value: value/100,

            color: c,

            backgroundColor: Colors.grey.shade300,

          ),

        ],

      ),

    );

  }

  int avg(){

    if(strainData.isEmpty) return 0;

    int sum = strainData.values.reduce((a,b)=>a+b);

    return (sum/strainData.length).round();

  }

}