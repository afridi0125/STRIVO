import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  DateTime currentMonth = DateTime.now();
  DateTime selectedDate = DateTime.now();

  List<String> weekDays = ["Sat","Sun","Mon","Tue","Wed","Thu","Fri"];

  int daysInMonth(DateTime date) {

    final lastDay = DateTime(date.year, date.month + 1, 0);

    return lastDay.day;

  }

  int startOffset(DateTime date) {

    return DateTime(date.year, date.month, 1).weekday % 7;

  }

  void changeMonth(int value) {

    setState(() {

      currentMonth = DateTime(
        currentMonth.year,
        currentMonth.month + value,
      );

    });

  }

  @override
  Widget build(BuildContext context) {

    int totalDays = daysInMonth(currentMonth);

    int offset = startOffset(currentMonth);

    return Scaffold(

      backgroundColor: const Color(0xfff4f4f4),

      body: SafeArea(

        child: Column(

          children: [

            const SizedBox(height: 20),

            /// HEADER
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(

                children: [

                  IconButton(

                    onPressed: () {

                      Navigator.pop(context);

                    },

                    icon: const Icon(Icons.arrow_back),

                  ),

                  const CircleAvatar(

                    radius: 24,

                    backgroundImage:
                    AssetImage("assets/images/profile.jpg"),

                  ),

                  const SizedBox(width: 12),

                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      const Text(

                        "Hello Linh!",

                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),

                      ),

                      Text(

                        "${selectedDate.day} ${monthName(selectedDate.month)} ${selectedDate.year}",

                        style: const TextStyle(

                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        ),

                      ),

                    ],

                  ),

                ],

              ),

            ),

            const SizedBox(height: 20),

            /// CALENDAR CARD
            Expanded(

              child: Container(

                margin: const EdgeInsets.symmetric(horizontal: 18),

                padding: const EdgeInsets.all(20),

                decoration: const BoxDecoration(

                  color: Color(0xffbcd6d9),

                  borderRadius: BorderRadius.only(

                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),

                  ),

                ),

                child: Column(

                  children: [

                    /// MONTH HEADER
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        GestureDetector(

                          onTap: () => changeMonth(-1),

                          child: const CircleAvatar(

                            backgroundColor: Colors.white,

                            child: Icon(Icons.arrow_back_ios_new),

                          ),

                        ),

                        Column(

                          children: [

                            Text(

                              weekdayName(selectedDate.weekday),

                              style: const TextStyle(fontSize: 18),

                            ),

                            Text(

                              "${selectedDate.day} ${monthName(currentMonth.month)}",

                              style: const TextStyle(

                                fontSize: 24,
                                fontWeight: FontWeight.bold,

                              ),

                            ),

                          ],

                        ),

                        GestureDetector(

                          onTap: () => changeMonth(1),

                          child: const CircleAvatar(

                            backgroundColor: Colors.white,

                            child: Icon(Icons.arrow_forward_ios),

                          ),

                        ),

                      ],

                    ),

                    const SizedBox(height: 20),

                    /// DAYS GRID
                    Expanded(

                      child: GridView.builder(

                        physics: const NeverScrollableScrollPhysics(),

                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(

                          crossAxisCount: 7,

                        ),

                        itemCount: totalDays + offset,

                        itemBuilder: (context, index) {

                          if (index < offset) {

                            return const SizedBox();

                          }

                          int day = index - offset + 1;

                          bool selected =
                              selectedDate.day == day &&
                                  selectedDate.month ==
                                      currentMonth.month;

                          return GestureDetector(

                            onTap: () {

                              setState(() {

                                selectedDate = DateTime(

                                  currentMonth.year,
                                  currentMonth.month,
                                  day,

                                );

                              });

                            },

                            child: Container(

                              margin: const EdgeInsets.all(6),

                              decoration: BoxDecoration(

                                shape: BoxShape.circle,

                                color: selected
                                    ? const Color(0xff58c7cf)
                                    : Colors.transparent,

                              ),

                              child: Center(

                                child: Text(

                                  "$day",

                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,

                                    color: selected
                                        ? Colors.white
                                        : Colors.black,

                                  ),

                                ),

                              ),

                            ),

                          );

                        },

                      ),

                    ),

                    const SizedBox(height: 8),

                    /// WEEK LABELS
                    Row(

                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: weekDays.map((day) {

                        return Text(

                          day,

                          style: TextStyle(

                            fontWeight: FontWeight.bold,

                            color: day == "Tue"
                                ? Colors.black
                                : const Color(0xff58c7cf),

                          ),

                        );

                      }).toList(),

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

  String monthName(int month) {

    List names = [

      "January","February","March","April",

      "May","June","July","August",

      "September","October","November","December"

    ];

    return names[month - 1];

  }

  String weekdayName(int day) {

    List names = [

      "Monday","Tuesday","Wednesday",

      "Thursday","Friday","Saturday","Sunday"

    ];

    return names[day - 1];

  }

}