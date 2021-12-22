import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siemens_assessment/colors.dart';
import 'package:siemens_assessment/components.dart';
import 'package:siemens_assessment/controller.dart';

class EditValues extends StatelessWidget {
  final CustomController controller;
  const EditValues({Key? key, required this.controller}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.darkPurple,
          title: const Text(
            'Edit values',
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text('AVAILABILITY PERCENTAGE'),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.availabilityTxtController,
                          // onChanged: (a) {
                          //   perc = a;
                          // },
                          onSaved: (b) {
                            controller.availabilityPercentage.value =
                                double.parse(b!);
                          },
                          validator: (a) {
                            if (a!.isEmpty) {
                              return 'Cant be empty';
                            }
                            if (double.parse(a) > 100.0 ||
                                double.parse(a) < 1.0) {
                              return 'Value has to be between 0 and 100';
                            }
                          },
                          cursorColor: Colors.grey,
                          decoration:
                              buildInputDecoration('Availability Percentage'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('DEFIBRILATOR'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: controller.defValOneTxtController,
                                onSaved: (b) {
                                  controller.defibrilatorValueOne.value =
                                      int.parse(b!);
                                },
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Cant be empty';
                                  }
                                  if (int.parse(a) > 75 ||
                                      double.parse(a) >
                                          controller
                                              .defibrilatorValueTwo.value ||
                                      int.parse(a) < 0) {
                                    return '0 < X < Value Two';
                                  }
                                },
                                cursorColor: Colors.grey,
                                decoration:
                                    buildInputDecoration('Defib value one'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: controller.defValTwoTxtController,
                                onSaved: (a) {
                                  controller.defibrilatorValueTwo.value =
                                      int.parse(a!);
                                },
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Cant be empty';
                                  }
                                  if (int.parse(a) > 75.0 ||
                                      int.parse(a) <
                                          controller
                                              .defibrilatorValueOne.value ||
                                      int.parse(a) < 0) {
                                    return 'Value One < X < 75';
                                  }
                                },
                                cursorColor: Colors.grey,
                                decoration:
                                    buildInputDecoration('Defib value two'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('DIALYSIS'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller:
                                    controller.dialysisValOneTxtController,
                                onSaved: (a) {
                                  controller.dialysisValueOne.value =
                                      int.parse(a!);
                                },

                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Cant be empty';
                                  }
                                  if (int.parse(a) > 75 ||
                                      double.parse(a) >
                                          controller.dialysisValueTwo.value ||
                                      int.parse(a) < 0) {
                                    return '0 < X < Value Two';
                                  }
                                },
                                cursorColor: Colors.grey,
                                // keyboardType: TextInputType.number,
                                decoration:
                                    buildInputDecoration('dialysis value one'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller:
                                    controller.dialysisValTwoTxtController,
                                onSaved: (a) {
                                  controller.dialysisValueTwo.value =
                                      int.parse(a!);
                                },
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Cant be empty';
                                  }
                                  if (int.parse(a) > 75.0 ||
                                      int.parse(a) <
                                          controller.dialysisValueOne.value ||
                                      int.parse(a) < 0) {
                                    return 'Value One < X < 75';
                                  }
                                },
                                cursorColor: Colors.grey,
                                // keyboardType: TextInputType.number,
                                decoration:
                                    buildInputDecoration('dialysis value two'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('X-RAY'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: controller.xrayValOneTxtController,
                                onSaved: (a) {
                                  controller.xrayValueOne.value = int.parse(a!);
                                },
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Cant be empty';
                                  }
                                  if (int.parse(a) > 75 ||
                                      double.parse(a) >
                                          controller.xrayValueTwo.value ||
                                      int.parse(a) < 0) {
                                    return '0 < X < Value Two';
                                  }
                                },
                                cursorColor: Colors.grey,
                                decoration:
                                    buildInputDecoration('xray value one'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller: controller.xrayValTwoTxtController,
                                onSaved: (a) {
                                  controller.xrayValueTwo.value = int.parse(a!);
                                },
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Cant be empty';
                                  }
                                  if (int.parse(a) > 75.0 ||
                                      int.parse(a) <
                                          controller.xrayValueOne.value ||
                                      int.parse(a) < 0) {
                                    return 'Value One < X < 75';
                                  }
                                },
                                cursorColor: Colors.grey,
                                decoration:
                                    buildInputDecoration('xray value two'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('WHEELCHAIR'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller:
                                    controller.wheelChairValOneTxtController,
                                onSaved: (a) {
                                  controller.wheelChairValueOne.value =
                                      int.parse(a!);
                                },

                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Cant be empty';
                                  }
                                  if (int.parse(a) > 75 ||
                                      double.parse(a) >
                                          controller.wheelChairValueTwo.value ||
                                      int.parse(a) < 0) {
                                    return '0 < X < Value Two';
                                  }
                                },
                                cursorColor: Colors.grey,
                                // keyboardType: TextInputType.number,
                                decoration: buildInputDecoration(
                                    'wheelchair value one'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextFormField(
                                controller:
                                    controller.wheelChairValTWoTxtController,
                                onSaved: (a) {
                                  controller.wheelChairValueTwo.value =
                                      int.parse(a!);
                                },
                                validator: (a) {
                                  if (a!.isEmpty) {
                                    return 'Cant be empty';
                                  }
                                  if (int.parse(a) > 75.0 ||
                                      int.parse(a) <
                                          controller.wheelChairValueOne.value ||
                                      int.parse(a) < 0) {
                                    return 'Value One < X < 75';
                                  }
                                },
                                cursorColor: Colors.grey,
                                decoration: buildInputDecoration(
                                    'Wheelchair value two'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            label: 'SAVE',
                            onPressed: () {
                              {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  Navigator.pop(context);
                                } else {}
                              }
                            },
                            backgroundColor: CustomColors.darkPurple),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black54),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
