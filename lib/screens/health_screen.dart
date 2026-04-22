import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/bottom_menu_bar.dart';
import 'home_screen.dart';
import 'discovery_screen.dart';
import 'profile_screen.dart';

class HealthScreen extends StatefulWidget {

  final String selectedWorkout;
  final String gender;

  const HealthScreen({
    super.key,
    required this.selectedWorkout,
    this.gender = "male",
  });

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {

  int selectedIndex = 2;

  int steps = 3200;
  int calories = 120;
  int activeMinutes = 35;

  int protein = 65;
  int sleep = 7;
  int streak = 5;

  /// medication list
  List<Map<String,String>> medicines = [];

  /// water tracker
  double waterLiters = 1.5;
  double waterGoal = 4.0;

  bool showFront = true;

  File? uploadedImage;

  late Timer timer;

  final ImagePicker picker = ImagePicker();

  /// fake live steps
  @override
  void initState(){

    super.initState();

    timer = Timer.periodic(

      const Duration(seconds: 3),

          (_){

        setState(() {

          steps += 4;
          calories += 1;
          activeMinutes += 1;

        });

      },

    );

  }

  @override
  void dispose(){

    timer.cancel();

    super.dispose();

  }

  /// navigation
  void changeTab(int index){

    if(index==0){

      Navigator.pushReplacement(context,

        MaterialPageRoute(

          builder: (_) => HomeScreen(
            selectedWorkout: widget.selectedWorkout,
          ),

        ),

      );

    }

    if(index==1){

      Navigator.pushReplacement(context,

        MaterialPageRoute(

          builder: (_) => DiscoveryScreen(
            selectedWorkout: widget.selectedWorkout,
          ),

        ),

      );

    }

    if(index==3){

      Navigator.pushReplacement(context,

        MaterialPageRoute(

          builder: (_) => ProfileScreen(
            selectedWorkout: widget.selectedWorkout,
          ),

        ),

      );

    }

  }

  /// pick workout image
  Future pickImage() async {

    final XFile? image =
    await picker.pickImage(source: ImageSource.gallery);

    if(image!=null){

      setState(()=>uploadedImage = File(image.path));

    }

  }

  /// muscle image based on gender
  String getBodyImage(){

    if(widget.gender=="female"){

      return showFront
          ? "assets/images/female_front.png"
          : "assets/images/female_back.png";

    }

    return showFront
        ? "assets/images/male_front.png"
        : "assets/images/male_back.png";

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      backgroundColor: const Color(0xfff5f5f5),

      body: SafeArea(

        child: ListView(

          padding: const EdgeInsets.all(20),

          children: [

            const Text(

              "Health",

              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height:20),

            heartRings(),

            const SizedBox(height:20),

            sleepCard(),

            const SizedBox(height:20),

            activityRow(),

            const SizedBox(height:20),

            foodCard(),

            const SizedBox(height:20),

            medicationCard(),

            const SizedBox(height:20),

            hydrationCard(),

            const SizedBox(height:20),

            streakCard(),

            const SizedBox(height:20),

            bodyStrainSection(),

            const SizedBox(height:40),

          ],

        ),

      ),

      bottomNavigationBar:

      BottomMenuBar(
        selectedIndex: selectedIndex,
        onTap: changeTab,
      ),

    );

  }

  /// rings
  Widget heartRings(){

    return whiteCard(

      Column(

        children: [

          SizedBox(

            width:150,
            height:150,

            child: Stack(

              alignment: Alignment.center,

              children: [

                SizedBox(

                  width:150,
                  height:150,

                  child: CircularProgressIndicator(

                    value: (steps/10000).clamp(0.0,1.0),
                    strokeWidth:12,
                    color: Colors.pink,

                  ),

                ),

                SizedBox(

                  width:120,
                  height:120,

                  child: CircularProgressIndicator(

                    value: (activeMinutes/90).clamp(0.0,1.0),
                    strokeWidth:10,
                    color: Colors.blue,

                  ),

                ),

                SizedBox(

                  width:90,
                  height:90,

                  child: CircularProgressIndicator(

                    value: (calories/300).clamp(0.0,1.0),
                    strokeWidth:8,
                    color: Colors.green,

                  ),

                ),

                Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(

                      steps.toString(),

                      style: const TextStyle(
                        fontSize:18,
                        fontWeight: FontWeight.bold,
                      ),

                    ),

                    const Text("Steps")

                  ],

                )

              ],

            ),

          ),

          const SizedBox(height:20),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [

              statItem("Steps", steps.toString()),
              statItem("Time", "$activeMinutes min"),
              statItem("Calories", "$calories kcal"),

            ],

          ),

        ],

      ),

    );

  }

  Widget statItem(String label,String value){

    return Column(

      children: [

        Text(value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        Text(label),

      ],

    );

  }

  /// sleep
  Widget sleepCard(){

    return whiteCard(

      Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text("Sleep"),

          Slider(

            value: sleep.toDouble(),

            min:0,
            max:12,

            onChanged:(v){

              setState(()=>sleep=v.toInt());

            },

          ),

          Text("$sleep hrs"),

        ],

      ),

    );

  }

  /// quick activity buttons
  Widget activityRow(){

    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        activityBtn(Icons.directions_walk,"Walk"),
        activityBtn(Icons.directions_run,"Run"),
        activityBtn(Icons.directions_bike,"Cycle"),
        activityBtn(Icons.medication,"Medicine"),

      ],

    );

  }

  Widget activityBtn(IconData icon,String text){

    return Column(

      children: [

        CircleAvatar(

          radius:28,
          backgroundColor: Colors.white,

          child: Icon(icon,color: Colors.black),

        ),

        const SizedBox(height:6),

        Text(text),

      ],

    );

  }

  /// food
  Widget foodCard(){

    return whiteCard(

      Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text("Food"),

          LinearProgressIndicator(value: calories/2000),

          const SizedBox(height:6),

          Text("$calories kcal"),
          Text("$protein g protein"),

        ],

      ),

    );

  }

  /// MEDICATION UI
  Widget medicationCard(){

    return whiteCard(

      Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            "Medication",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height:10),

          ElevatedButton(

            onPressed: addMedicineDialog,

            child: const Text("Add Medicine"),

          ),

          const SizedBox(height:10),

          if(medicines.isEmpty)
            const Text("No medicines added"),

          ...medicines.map(

                (m)=>ListTile(

              leading: const Icon(Icons.medication),

              title: Text(m["name"]!),

              subtitle: Text("Time: ${m["time"]}"),

              trailing: IconButton(

                icon: const Icon(Icons.delete),

                onPressed: (){

                  setState(()=>medicines.remove(m));

                },

              ),

            ),

          )

        ],

      ),

    );

  }

  /// add medicine popup
  Future addMedicineDialog() async {

    TextEditingController nameController = TextEditingController();

    TimeOfDay selectedTime = TimeOfDay.now();

    showDialog(

      context: context,

      builder: (_){

        return AlertDialog(

          title: const Text("Add Medication"),

          content: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Medicine name"),
              ),

              const SizedBox(height:10),

              ElevatedButton(

                onPressed: () async {

                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );

                  if(time!=null){

                    selectedTime = time;

                  }

                },

                child: const Text("Select time"),

              ),

            ],

          ),

          actions: [

            ElevatedButton(

              onPressed: (){

                if(nameController.text.isNotEmpty){

                  setState((){

                    medicines.add({

                      "name": nameController.text,
                      "time": selectedTime.format(context),

                    });

                  });

                }

                Navigator.pop(context);

              },

              child: const Text("Save"),

            )

          ],

        );

      },

    );

  }

  /// water liters
  Widget hydrationCard(){

    double progress =
    (waterLiters / waterGoal).clamp(0.0,1.0);

    return whiteCard(

      Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            "Water Intake",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height:10),

          LinearProgressIndicator(value: progress),

          const SizedBox(height:10),

          Text("${waterLiters.toStringAsFixed(1)} / $waterGoal L"),

          const SizedBox(height:10),

          Row(

            children: [

              ElevatedButton(

                onPressed: (){

                  setState((){

                    waterLiters += 0.25;

                    if(waterLiters > waterGoal){

                      waterLiters = waterGoal;

                    }

                  });

                },

                child: const Text("+250ml"),

              ),

              const SizedBox(width:10),

              ElevatedButton(

                onPressed: (){

                  setState((){

                    waterLiters += 0.5;

                    if(waterLiters > waterGoal){

                      waterLiters = waterGoal;

                    }

                  });

                },

                child: const Text("+500ml"),

              ),

            ],

          )

        ],

      ),

    );

  }

  /// streak
  Widget streakCard(){

    return whiteCard(

      Text(

        "Workout streak 🔥 $streak days",

        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),

      ),

    );

  }

  /// PBSS heatmap
  Widget bodyStrainSection(){

    return whiteCard(

      Column(

        children: [

          const Text(
            "Body Strain",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height:10),

          Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              ElevatedButton(

                onPressed: ()=>setState(()=>showFront=true),

                child: const Text("Front"),

              ),

              const SizedBox(width:10),

              ElevatedButton(

                onPressed: ()=>setState(()=>showFront=false),

                child: const Text("Back"),

              ),

            ],

          ),

          const SizedBox(height:20),

          Image.asset(getBodyImage(),height:220),

          const SizedBox(height:20),

          ElevatedButton(

            onPressed: pickImage,

            child: const Text("Upload workout image"),

          ),

          const SizedBox(height:10),

          if(uploadedImage!=null)

            Column(

              children: [

                Image.file(uploadedImage!,height:120),

                const SizedBox(height:10),

                heatmap(),

                TextButton(

                  onPressed: (){

                    setState(()=>uploadedImage=null);

                  },

                  child: const Text("Delete"),

                ),

              ],

            )

        ],

      ),

    );

  }

  Widget heatmap(){

    Map<String,double> strain={

      "Chest":0.6,
      "Core":0.7,
      "Shoulders":0.5,
      "Legs":0.4,

    };

    return Column(

      children: strain.entries.map(

            (e)=>Column(

          children: [

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text(e.key),
                Text("${(e.value*100).toInt()}%"),

              ],

            ),

            LinearProgressIndicator(
              value: e.value,
              color: heatColor(e.value),
            ),

            const SizedBox(height:8),

          ],

        ),

      ).toList(),

    );

  }

  Color heatColor(double v){

    if(v>0.7) return Colors.red;
    if(v>0.5) return Colors.orange;
    if(v>0.3) return Colors.yellow;

    return Colors.green;

  }

  Widget whiteCard(Widget child){

    return Container(

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

      ),

      child: child,

    );

  }

}