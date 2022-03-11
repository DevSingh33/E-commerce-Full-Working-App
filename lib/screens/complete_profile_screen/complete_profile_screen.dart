import 'package:flutter/material.dart';

import 'package:e_commerce/screens/complete_profile_screen/components/complete_profile_form.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/complete_profile_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  'Complete Profile',
                  style: headingStyle,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                const Text(
                  'Complete your details or continue \nwith your social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                const CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing you confirm that you agree \nwith our Terms and Conditions',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
