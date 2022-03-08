import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCardSingleWidget extends StatelessWidget {
  const SocialCardSingleWidget({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);
  final String icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
        ),
        decoration: const BoxDecoration(
            color: Color(0xFFF5F6F9), shape: BoxShape.circle),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
