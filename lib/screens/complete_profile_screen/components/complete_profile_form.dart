import 'package:flutter/material.dart';

import 'package:e_commerce/screens/otp_screen/otp_screen.dart';
import 'package:e_commerce/screens/sign_in_screen/components/form_errortexts_widget.dart';
import 'package:e_commerce/screens/sign_in_screen/components/suffix_icon_widget.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widgets/default_button.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errorTexts = [];
  String firstName = 'defaultFirstName';
  String lastName = 'defaultLastName';
  String phoneNumber = '9043143252';
  String address = 'default address';

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
          SizedBox(height: getProportionateScreenHeight(10)),
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPhoneNoFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildAddressFormField(),
          FormErrorTextWidget(errorTexts: errorTexts),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
              onPress: () {
                if (_formKey.currentState != null) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // if all are valid then go to success screen
                    Navigator.pushNamed(context, OtpScreen.routeName);
                  }
                }
              },
              buttonText: 'Continue'),
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (value) {
        if (value != null) {
          firstName = value;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        firstName = value;
      },
      validator: (input) {
        if (input != null) {
          if (input.isEmpty) {
            addError(error: kNamelNullError);
            return '';
          }
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text('First Name'),
        hintText: 'Enter your first name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SuffixIconWidget(
          suffixIconPath: 'assets/icons/User.svg',
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (value) {
        if (value != null) {
          lastName = value;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        lastName = value;
      },
      validator: (input) {
        if (input != null) {
          if (input.isEmpty) {
            addError(error: kNamelNullError);
            return '';
          }
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text('Last Name'),
        hintText: 'Enter your last name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SuffixIconWidget(
          suffixIconPath: 'assets/icons/User.svg',
        ),
      ),
    );
  }

  TextFormField buildPhoneNoFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (value) {
        if (value != null) {
          phoneNumber = value;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        phoneNumber = value;
      },
      validator: (input) {
        if (input != null) {
          if (input.isEmpty) {
            addError(error: kPhoneNumberNullError);
            return '';
          }
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text('Phone Number'),
        hintText: 'Enter your phone number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SuffixIconWidget(
          suffixIconPath: 'assets/icons/Phone.svg',
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      maxLines: 2,
      onSaved: (value) {
        if (value != null) {
          address = value;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
      },
      validator: (input) {
        if (input != null) {
          if (input.isEmpty) {
            addError(error: kAddressNullError);
            return '';
          }
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text('Address'),
        hintText: 'Enter your address',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: SuffixIconWidget(
          suffixIconPath: 'assets/icons/Location point.svg',
        ),
      ),
    );
  }
}
