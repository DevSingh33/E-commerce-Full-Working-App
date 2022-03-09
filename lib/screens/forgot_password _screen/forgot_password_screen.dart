import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_in_screen/components/form_errortexts_widget.dart';
import 'package:e_commerce/screens/sign_in_screen/components/suffix_icon_widget.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/default_button.dart';
import 'package:e_commerce/widgets/no_acc_sign_up_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgot_password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Please enter your email and we will send \nyou a link to return to your acciunt',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                const ForgotPasswordForm(),
                const NoAccountSignUpWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errorTexts = [];
  late String userEmail;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) {
              if (newValue != null) {
                userEmail = newValue;
                print(userEmail);
              }
            },
            onChanged: (value) {
              if (value.isNotEmpty && errorTexts.contains(kEmailNullError)) {
                setState(() {
                  errorTexts.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errorTexts.contains(kInvalidEmailError)) {
                setState(() {
                  errorTexts.remove(kInvalidEmailError);
                });
              }
            },
            validator: (input) {
              if (input != null) {
                if (input.isEmpty && !errorTexts.contains(kEmailNullError)) {
                  setState(() {
                    errorTexts.add(kEmailNullError);
                  });
                } else if (!emailValidatorRegExp.hasMatch(input) &&
                    !errorTexts.contains(kInvalidEmailError)) {
                  setState(() {
                    errorTexts.add(kInvalidEmailError);
                  });
                }
              }
              return null;
            },
            decoration: const InputDecoration(
              label: Text('Email'),
              hintText: 'Enter your email',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: SuffixIconWidget(
                suffixIconPath: 'assets/icons/Mail.svg',
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormErrorTextWidget(errorTexts: errorTexts),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
              onPress: () {
                if (_formKey.currentState != null) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    //TODO : add email register and forgot password
                  }
                }
              },
              buttonText: 'Continue'),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
        ],
      ),
    );
  }
}
