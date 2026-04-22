import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {

  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();

}

class _PreferencesScreenState extends State<PreferencesScreen> {

  bool notification=true;

  bool dark=false;

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(title: const Text("Preferences")),

      body: ListView(

        children: [

          SwitchListTile(

            value: notification,

            title: const Text("Notifications"),

            onChanged:(v){

              setState(()=>notification=v);

            },

          ),

          SwitchListTile(

            value: dark,

            title: const Text("Dark mode"),

            onChanged:(v){

              setState(()=>dark=v);

            },

          ),

        ],

      ),

    );

  }

}