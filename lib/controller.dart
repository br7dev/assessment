import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomController extends GetxController {
  final availabilityPercentage = 12.5.obs;
  final defibrilatorValueOne = 45.obs;
  final defibrilatorValueTwo = 75.obs;
  final dialysisValueOne = 24.obs;
  final dialysisValueTwo = 53.obs;
  final xrayValueOne = 20.obs;
  final xrayValueTwo = 48.obs;
  final wheelChairValueOne = 38.obs;
  final wheelChairValueTwo = 55.obs;

  var availabilityTxtController = TextEditingController();
  var defValOneTxtController = TextEditingController();
  var defValTwoTxtController = TextEditingController();
  var dialysisValOneTxtController = TextEditingController();
  var dialysisValTwoTxtController = TextEditingController();
  var xrayValOneTxtController = TextEditingController();
  var xrayValTwoTxtController = TextEditingController();
  var wheelChairValOneTxtController = TextEditingController();
  var wheelChairValTWoTxtController = TextEditingController();

  @override
  void onInit() {
    availabilityTxtController.text = availabilityPercentage.toString();
    defValOneTxtController.text = defibrilatorValueOne.toString();
    defValTwoTxtController.text = defibrilatorValueTwo.toString();
    dialysisValOneTxtController.text = dialysisValueOne.value.toString();
    dialysisValTwoTxtController.text = dialysisValueTwo.value.toString();
    xrayValOneTxtController.text = xrayValueOne.value.toString();
    xrayValTwoTxtController.text = xrayValueTwo.value.toString();
    wheelChairValOneTxtController.text = wheelChairValueOne.value.toString();
    wheelChairValTWoTxtController.text = wheelChairValueTwo.value.toString();
    super.onInit();
  }
}
