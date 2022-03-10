import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class OtpTimer extends StatelessWidget {
  const OtpTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This code will expire in'),
        TweenAnimationBuilder(
            tween: IntTween(
              begin: 60,
              end: 0,
            ),
            duration: const Duration(minutes: 1),
            builder: (context, int value, child) {
              return Text(
                ' 00:${value.toInt()}',
                style: const TextStyle(color: kPrimaryColor),
              );
            }),
      ],
    );
  }
}
