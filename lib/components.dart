import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'controller.dart';

class CustomCharts extends StatelessWidget {
  final String label;
  final int valueOne;
  final int valueTwo;
  const CustomCharts(
      {Key? key,
      required this.label,
      required this.valueOne,
      required this.valueTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: CustomColors.lightPurple,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 1,
                      ),
                      Text(
                        valueTwo.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                height: 30,
                width: MediaQuery.of(context).size.width *
                    ((valueTwo / 100) + 0.15),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: CustomColors.darkPurple,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        valueOne.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                height: 30,
                width: MediaQuery.of(context).size.width *
                    ((valueOne / 100) + 0.15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Indicators extends StatelessWidget {
  const Indicators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 18,
                width: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.lightPurple,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text('Needs Maintenance'),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 18,
                width: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.darkPurple,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text('Usable'),
            ],
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color backgroundColor;
  const CustomButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        fixedSize: MaterialStateProperty.all<Size>(const Size(160, 40)),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class AvailabilityCard extends StatelessWidget {
  final CustomController controller;
  final double valueOne;
  final double valueTwo;

  AvailabilityCard(
      {Key? key,
      required this.controller,
      required this.valueOne,
      required this.valueTwo})
      : super(key: key);
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      shadowColor: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Availability Rate',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Currently in use',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
            AnimatedCircularChart(
              key: _chartKey,
              size: const Size(200, 200),
              holeRadius: 40,
              initialChartData: <CircularStackEntry>[
                CircularStackEntry(
                  <CircularSegmentEntry>[
                    CircularSegmentEntry(
                      valueOne,
                      Colors.blueGrey[600],
                      rankKey: 'completed',
                    ),
                    CircularSegmentEntry(
                      valueTwo,
                      Colors.grey[300],
                      rankKey: 'remaining',
                    ),
                  ],
                  rankKey: 'progress',
                ),
              ],
              chartType: CircularChartType.Radial,
              percentageValues: true,
              holeLabel: '$valueOne%',
              labelStyle: TextStyle(
                color: Colors.blueGrey[600],
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: 'Maps',
          icon: Icon(Icons.map),
        ),
        BottomNavigationBarItem(
          label: 'Task List',
          icon: Icon(Icons.task),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
