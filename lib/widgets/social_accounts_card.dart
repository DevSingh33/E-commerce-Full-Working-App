import 'package:e_commerce/widgets/social_single_widget.dart';
import 'package:flutter/material.dart';

class SocialAccountsCard extends StatelessWidget {
  const SocialAccountsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCardSingleWidget(
            icon: 'assets/icons/google-icon.svg', onPress: () {}),
        SocialCardSingleWidget(
            icon: 'assets/icons/facebook-2.svg', onPress: () {}),
        SocialCardSingleWidget(
            icon: 'assets/icons/twitter.svg', onPress: () {}),
      ],
    );
  }
}
