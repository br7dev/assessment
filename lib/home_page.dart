import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:siemens_assessment/coming_soon.dart';
import 'package:siemens_assessment/edit_values.dart';
import 'package:siemens_assessment/colors.dart';
import 'package:get/get.dart';

import 'components.dart';
import 'controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CustomController controller = Get.put(CustomController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const _Header(),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => CustomCharts(
                    label: 'DEFIBRILATOR',
                    valueOne: controller.defibrilatorValueOne.value,
                    valueTwo: controller.defibrilatorValueTwo.value,
                  ),
                ),
                Obx(
                  () => CustomCharts(
                    label: 'DIALYSIS',
                    valueOne: controller.dialysisValueOne.value,
                    valueTwo: controller.dialysisValueTwo.value,
                  ),
                ),
                Obx(
                  () => CustomCharts(
                    label: 'X-RAY',
                    valueOne: controller.xrayValueOne.value,
                    valueTwo: controller.xrayValueTwo.value,
                  ),
                ),
                Obx(
                  () => CustomCharts(
                    label: 'WHEELCHAIR',
                    valueOne: controller.wheelChairValueOne.value,
                    valueTwo: controller.wheelChairValueTwo.value,
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Indicators(),
                const SizedBox(
                  height: 40,
                ),
                Obx(
                  () => AvailabilityCard(
                    controller: controller,
                    valueOne: controller.availabilityPercentage.value,
                    valueTwo: (100 - controller.availabilityPercentage.value),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      label: 'Edit',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditValues(controller: controller)),
                        );
                      },
                      backgroundColor: Colors.blueAccent,
                    ),
                    CustomButton(
                      label: 'Return to Map View',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ComingSoon()),
                        );
                      },
                      backgroundColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.insert_chart),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Prep/Recovery Room, 2F',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Treatment',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
        const Icon(Icons.menu),
      ],
    );
  }
}
