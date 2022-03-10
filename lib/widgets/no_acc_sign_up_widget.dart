import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_up_screen/sign_up_screen.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class NoAccountSignUpWidget extends StatelessWidget {
  const NoAccountSignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an accout?',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(SignUpScreen.routeName),
          child: Text(
            ' Sign Up',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
