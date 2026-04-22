import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {

  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(title: const Text("Account")),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: const [

          ListTile(title: Text("Email")),

          ListTile(title: Text("Phone")),

          ListTile(title: Text("Change password")),

          ListTile(title: Text("Delete account")),

        ],

      ),

    );

  }

}