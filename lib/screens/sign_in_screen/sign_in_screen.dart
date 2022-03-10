import 'package:flutter/material.dart';

import 'package:e_commerce/screens/sign_in_screen/components/sign_in_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/no_acc_sign_up_widget.dart';
import 'package:e_commerce/widgets/social_accounts_card.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/sign_in';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign In'),
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
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Sign in with your email and password \nor continue with social media.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  const SignInForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  const Hero(tag: 'socialcard', child: SocialAccountsCard()),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const NoAccountSignUpWidget(),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
