import 'package:flutter/material.dart';

class BottomMenuBar extends StatefulWidget {

  final int selectedIndex;

  final Function(int) onTap;

  const BottomMenuBar({

    super.key,

    required this.selectedIndex,

    required this.onTap,

  });

  @override
  State<BottomMenuBar> createState() => _BottomMenuBarState();

}

class _BottomMenuBarState extends State<BottomMenuBar> {

  List<String> icons = [

    "assets/images/home.png",
    "assets/images/discovery.png",
    "assets/images/health.png",
    "assets/images/profile_icon.png",

  ];

  List<String> labels = [

    "Home",
    "Discovery",
    "Health",
    "Profile",

  ];

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),

      padding: const EdgeInsets.symmetric(vertical: 12),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(25),

        boxShadow: [

          BoxShadow(

            blurRadius: 15,

            color: Colors.black.withOpacity(.08),

          )

        ],

      ),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: List.generate(

          4,

              (index) {

            bool active = widget.selectedIndex == index;

            return GestureDetector(

              onTap: () {

                widget.onTap(index);

              },

              child: AnimatedContainer(

                duration: const Duration(milliseconds: 250),

                padding: const EdgeInsets.symmetric(

                  horizontal: 14,
                  vertical: 8,

                ),

                decoration: BoxDecoration(

                  color: active
                      ? const Color(0xff52c3cc)
                      : Colors.transparent,

                  borderRadius: BorderRadius.circular(20),

                ),

                child: Column(

                  mainAxisSize: MainAxisSize.min,

                  children: [

                    Image.asset(

                      icons[index],

                      height: 22,

                      color: active
                          ? Colors.white
                          : Colors.black,

                    ),

                    const SizedBox(height: 3),

                    Text(

                      labels[index],

                      style: TextStyle(

                        fontSize: 11,

                        color: active
                            ? Colors.white
                            : Colors.black,

                      ),

                    ),

                  ],

                ),

              ),

            );

          },

        ),

      ),

    );

  }

}