import 'package:flutter/material.dart';

import 'package:e_commerce/screens/sign_up_screen/components/sign_up_form.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/social_accounts_card.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/sign_up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                  Text('Register Account', style: headingStyle),
                  const Text(
                    'Complete with your details or continue \nwith social media',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  const SignUpForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  const SocialAccountsCard(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    'By continuing you confirm that you agree \nwith our Terms and Conditions',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
