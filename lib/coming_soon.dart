import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siemens_assessment/colors.dart';
import 'package:siemens_assessment/components.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Page under construction',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              label: 'Back',
              backgroundColor: CustomColors.darkPurple,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
