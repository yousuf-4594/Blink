import 'package:flutter/material.dart';
import 'hours.dart';
import 'minutes.dart';

class HomePage extends StatefulWidget {
  static int preOrderHour = 8;
  static int preOrderMinute = 0;
  static String preOrderText = "08:00 am";
  static bool preOrder = false;
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = FixedExtentScrollController();
  }
  

  final List<int> selectedHours = [08, 09, 10, 11, 12, 01, 02, 03, 04];
  final List<int> selectedMinutes = [00, 10, 20, 30, 40, 50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 33, 33, 33),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),

          // hours wheel
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (index) {
                setState(() {
                  HomePage.preOrderHour = selectedHours[index];
                });
              },
              controller: _controller,
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 9,
                builder: (context, index) {
                  return MyHours(
                    hours: selectedHours[index],
                  );
                },
              ),
            ),
          ),

          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            child: const Text(
              ":",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white70,
              ),
            ),
          ),
          // minutes wheel
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (index) {
                setState(() {
                  HomePage.preOrderMinute = selectedMinutes[index];
                });
              },
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 6,
                builder: (context, index) {
                  return MyMinutes(
                    mins: selectedMinutes[index],
                  );
                },
              ),
            ),
          ),

          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
