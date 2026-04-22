import 'package:flutter/material.dart';

class PermissionsScreen extends StatelessWidget {

  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(title: const Text("Permissions")),

      body: const Padding(

        padding: EdgeInsets.all(20),

        child: Text(

          "Camera\nStorage\nNotifications\nInternet",

        ),

      ),

    );

  }

}