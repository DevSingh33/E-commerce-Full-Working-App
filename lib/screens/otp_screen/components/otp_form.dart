import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/default_button.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextFieldFocus(String value, FocusNode fcsNode) {
    if (value.length == 1) {
      fcsNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(26),
                  ),
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextFieldFocus(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  focusNode: pin2FocusNode,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(26),
                  ),
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextFieldFocus(value, pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  focusNode: pin3FocusNode,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(26),
                  ),
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextFieldFocus(value, pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  focusNode: pin4FocusNode,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(26),
                  ),
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    pin4FocusNode.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(onPress: () {}, buttonText: 'Continue'),
        ],
      ),
    );
  }
}
