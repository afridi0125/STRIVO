import 'package:flutter/material.dart';

import '../widgets/bottom_menu_bar.dart';
import '../services/session_service.dart';

import 'home_screen.dart';
import 'discovery_screen.dart';
import 'health_screen.dart';
import 'login_screen.dart';

import 'profile_settings_screen.dart';
import 'equipment_screen.dart';
import 'account_screen.dart';
import 'preferences_screen.dart';
import 'about_screen.dart';
import 'privacy_screen.dart';
import 'terms_screen.dart';
import 'permissions_screen.dart';

class ProfileScreen extends StatefulWidget {

  final String selectedWorkout;

  const ProfileScreen({
    super.key,
    required this.selectedWorkout,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  int selectedIndex = 3;

  /// bottom navigation
  void changeTab(int index){

    if(index == selectedIndex) return;

    if(index == 0){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(
            selectedWorkout: widget.selectedWorkout,
          ),
        ),
      );

    }

    if(index == 1){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DiscoveryScreen(
            selectedWorkout: widget.selectedWorkout,
          ),
        ),
      );

    }

    if(index == 2){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HealthScreen(
            selectedWorkout: widget.selectedWorkout,
          ),
        ),
      );

    }

  }

  /// LOGOUT
  Future logout() async {

    await SessionService.logout();

    Navigator.pushAndRemoveUntil(

      context,

      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),

          (route) => false,

    );

  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(

      onWillPop: () async {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(
              selectedWorkout: widget.selectedWorkout,
            ),
          ),
        );

        return false;

      },

      child: Scaffold(

        backgroundColor: const Color(0xfff5f5f5),

        body: SafeArea(

          child: Column(

            children: [

              Expanded(

                child: ListView(

                  padding: const EdgeInsets.all(20),

                  children: [

                    /// HEADER
                    Row(

                      children: [

                        const CircleAvatar(
                          radius: 28,
                          backgroundImage:
                          AssetImage("assets/images/profile.jpg"),
                        ),

                        const SizedBox(width: 14),

                        const Text(

                          "PROFILE",

                          style: TextStyle(

                            fontSize: 26,
                            fontWeight: FontWeight.bold,

                          ),

                        ),

                      ],

                    ),

                    const SizedBox(height: 25),

                    /// MENU
                    Container(

                      decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius: BorderRadius.circular(20),

                      ),

                      child: Column(

                        children: [

                          tile(Icons.person,"Profile settings",(){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const ProfileSettingsScreen(),
                              ),
                            );

                          }),

                          tile(Icons.fitness_center,"My Equipment",(){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const EquipmentScreen(),
                              ),
                            );

                          }),

                          tile(Icons.account_box,"Account details",(){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const AccountScreen(),
                              ),
                            );

                          }),

                          tile(Icons.tune,"Preferences",(){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const PreferencesScreen(),
                              ),
                            );

                          }),

                          tile(Icons.info_outline,"About",(){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const AboutScreen(),
                              ),
                            );

                          }),

                          tile(Icons.privacy_tip,"Privacy Policy",(){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const PrivacyScreen(),
                              ),
                            );

                          }),

                          tile(Icons.description,"Terms & Conditions",(){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const TermsScreen(),
                              ),
                            );

                          }),

                          tile(Icons.verified,"Licences",(){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const PermissionsScreen(),
                              ),
                            );

                          }),

                          tile(Icons.logout,"Log out", logout),

                        ],

                      ),

                    ),

                  ],

                ),

              ),

              BottomMenuBar(
                selectedIndex: selectedIndex,
                onTap: changeTab,
              ),

            ],

          ),

        ),

      ),

    );

  }

  /// TILE UI
  Widget tile(
      IconData icon,
      String title,
      VoidCallback onTap
      ){

    return Column(

      children: [

        ListTile(

          leading: Icon(icon),

          title: Text(

            title,

            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),

          ),

          trailing:
          const Icon(Icons.arrow_forward_ios,size:16),

          onTap: onTap,

        ),

        const Divider(height:1),

      ],

    );

  }

}