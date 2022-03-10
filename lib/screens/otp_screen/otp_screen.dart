import 'package:flutter/material.dart';

import 'package:e_commerce/screens/otp_screen/components/otp_form.dart';
import 'package:e_commerce/screens/otp_screen/components/otp_timer_widget.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static const routeName = '/otp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('data'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('OTP Verification', style: headingStyle),
                  const Text('We send your code to +1 901 431 ***'),
                  const OtpTimer(),
                  SizedBox(height: SizeConfig.screenHeight * 0.15),
                  const OtpForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  GestureDetector(
                    onTap: () {
                      //TODO resent OTP
                    },
                    child: const Text(
                      'Resend OTP code',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
