import 'package:flutter/material.dart';

import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/default_button.dart';

class SignInSuccessScreen extends StatelessWidget {
  const SignInSuccessScreen({Key? key}) : super(key: key);
  static const routeName = '/sign_in_sucess';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('Login Success'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Image.asset(
              'assets/images/success.png',
              height: SizeConfig.screenHeight * 0.4,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              'Login Success',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(onPress: () {}, buttonText: 'Back To Home'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
