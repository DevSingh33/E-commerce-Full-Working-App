import 'package:flutter/material.dart';

import 'package:e_commerce/screens/forgot_password%20_screen/forgot_password_screen.dart';
import 'package:e_commerce/screens/sign_in_screen/components/form_errortexts_widget.dart';
import 'package:e_commerce/screens/sign_in_screen/components/suffix_icon_widget.dart';
import 'package:e_commerce/screens/sign_in_success_screen/sign_in_success_screen.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/default_button.dart';

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
  String userEmail = 'default@email.com';
  String userPassword = 'defaultpassword';
  bool rememberUser = false;

  void addError({required String error}) {
    if (!errorTexts.contains(error)) {
      setState(() {
        errorTexts.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errorTexts.contains(error)) {
      setState(() {
        errorTexts.remove(error);
      });
    }
  }

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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ForgotPasswordScreen.routeName);
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
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
                      //TODO if registration success goto sign in success screen.

                      Navigator.of(context)
                          .pushNamed(SignInSuccessScreen.routeName);
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
      onSaved: (value) {
        if (value != null) {
          userEmail = value;
        }
      },
      onChanged: (value) {
        userEmail = value;
        print('email = $userEmail');
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (input) {
        if (input != null) {
          if (input.isEmpty) {
            addError(error: kEmailNullError);
            return '';
          } else if (!emailValidatorRegExp.hasMatch(input)) {
            addError(error: kInvalidEmailError);
            return '';
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
      onSaved: (value) {
        if (value != null) {
          userPassword = value;
        }
      },
      onChanged: (value) {
        userPassword = value;
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
      },
      validator: (input) {
        if (input != null) {
          if (input.isEmpty) {
            addError(error: kPassNullError);
            return '';
          } else if (input.length < 8) {
            addError(error: kShortPassError);
            return '';
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
