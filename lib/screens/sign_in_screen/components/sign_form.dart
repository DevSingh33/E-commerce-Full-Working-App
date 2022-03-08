import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_in_screen/components/form_errortexts_widget.dart';
import 'package:e_commerce/screens/sign_in_screen/components/suffix_icon_widget.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/default_button.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errorTexts = [];
  late String userEmail;
  late String userPassword;
  bool rememberUser = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailTextFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPasswordTextField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              children: [
                Checkbox(
                    activeColor: kPrimaryColor,
                    value: rememberUser,
                    onChanged: (newVal) {
                      if (newVal != null) {
                        setState(() {
                          rememberUser = newVal;
                        });
                      }
                    }),
                const Spacer(),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
            FormErrorTextWidget(errorTexts: errorTexts),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
                onPress: () {
                  if (_formKey.currentState != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  }
                },
                buttonText: 'Continue'),
          ],
        ));
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
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
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        if (newValue != null) {
          userPassword = newValue;
          print(userPassword);
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errorTexts.contains(kPassNullError)) {
          setState(() {
            errorTexts.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errorTexts.contains(kShortPassError)) {
          setState(() {
            errorTexts.remove(kShortPassError);
          });
        }
      },
      validator: (input) {
        if (input != null) {
          if (input.isEmpty && !errorTexts.contains(kPassNullError)) {
            setState(() {
              errorTexts.add(kPassNullError);
            });
          } else if (input.length < 8 &&
              !errorTexts.contains(kShortPassError)) {
            setState(() {
              errorTexts.add(kShortPassError);
            });
          }
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text('Password'),
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SuffixIconWidget(
          suffixIconPath: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }
}
