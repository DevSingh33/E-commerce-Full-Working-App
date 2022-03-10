import 'package:flutter/material.dart';

import 'package:e_commerce/screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:e_commerce/screens/sign_in_screen/components/form_errortexts_widget.dart';
import 'package:e_commerce/screens/sign_in_screen/components/suffix_icon_widget.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/default_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errorTexts = [];
  String userEmail = 'default@email.com';
  String userPassword = 'defaultpassword';
  String confirmPassword = 'defaultpassword';

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
    print(
        'user email = $userEmail, pass = $userPassword, confirm pass = $confirmPassword');
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildEmailTextField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPasswordTextField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildConfirmPasswordTextField(),
              FormErrorTextWidget(errorTexts: errorTexts),
              SizedBox(height: getProportionateScreenHeight(40)),
              DefaultButton(
                onPress: () {
                  if (_formKey.currentState != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // if all are valid then go to success screen
                      Navigator.pushNamed(
                          context, CompleteProfileScreen.routeName);
                    }
                  }
                },
                buttonText: 'Continue',
              ),
            ],
          ),
        ));
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        if (value != null) {
          userEmail = value;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errorTexts.contains(kEmailNullError)) {
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

  TextFormField buildConfirmPasswordTextField() {
    return TextFormField(
      obscureText: true,
      onSaved: (value) {
        if (value != null) {
          confirmPassword = value;
        }
      },
      onChanged: (value) {
        confirmPassword = value;

        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && userPassword == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (input) {
        if (input != null) {
          if (input.isEmpty) {
            addError(error: kPassNullError);
            return '';
          } else if (userPassword != input) {
            addError(error: kMatchPassError);
            return '';
          }
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text('Confirm Password'),
        hintText: 'Re-enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SuffixIconWidget(
          suffixIconPath: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }
}
