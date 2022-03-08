import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuffixIconWidget extends StatelessWidget {
  const SuffixIconWidget({
    Key? key,
    required this.suffixIconPath,
  }) : super(key: key);
  final String suffixIconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        suffixIconPath,
        height: getProportionateScreenHeight(18),
      ),
    );
  }
}
