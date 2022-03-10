import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:e_commerce/size_config.dart';

class FormErrorTextWidget extends StatelessWidget {
  const FormErrorTextWidget({Key? key, required this.errorTexts})
      : super(key: key);
  final List<String> errorTexts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errorTexts.length,
        (index) => showErrorTexts(
          errror: errorTexts[index],
        ),
      ),
    );
  }

  Row showErrorTexts({required String errror}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: getProportionateScreenHeight(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(errror),
      ],
    );
  }
}
