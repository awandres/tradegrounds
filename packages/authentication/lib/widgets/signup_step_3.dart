import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:authentication/widgets/auth_form_field.dart';

import 'package:authentication/providers/signup_provider.dart';

class SignupStep3 extends StatefulWidget {
  @override
  _SignupStep3State createState() => _SignupStep3State();
}

class _SignupStep3State extends State<SignupStep3> {
  ScrollController _scrollController = ScrollController();
  FocusScopeNode _focusScopeNode = FocusScopeNode();

  void handleSubmitted(String value) {
    print('handling submit');
    _focusScopeNode.nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    final signupService = Provider.of<AuthProvider>(context);
    final deviceSize = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(height: 50),
      Text(
        'Business Location',
        style: Theme.of(context).textTheme.title,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 30),
      AuthFormField(
        valueKey: 'streetAddress',
        labelText: 'Street Address',
        initialValue: signupService.streetAddress,
        keyboardType: TextInputType.streetAddress,
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.words,
        onSavedFunction: (String value) {
          signupService.setBusinessStreetAddress(value);
        },
        onFieldSubmitted: handleSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validatorFunction: requiredValidator,
        validatorErrorMessage: 'Please enter a street address',
      ),
      SizedBox(
        height: 10,
      ),
      AuthFormField(
        valueKey: 'unit',
        labelText: 'Unit, Apartment, etc.',
        initialValue: signupService.unit,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.words,
        onSavedFunction: (String value) {
          signupService.setBusinessAddressUnit(value);
        },
        onFieldSubmitted: handleSubmitted,
        validatorFunction: noValidation,
      ),
      SizedBox(
        height: 10,
      ),
      AuthFormField(
        valueKey: 'city',
        labelText: 'City',
        initialValue: signupService.city,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.words,
        onSavedFunction: (String value) {
          signupService.setBusinessCity(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validatorFunction: requiredValidator,
        validatorErrorMessage: 'City Required',
      ),
      SizedBox(height: 10),
      AuthFormField(
        valueKey: 'state',
        labelText: 'State',
        initialValue: signupService.state,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.characters,
        onSavedFunction: (String value) {
          signupService.setBusinessState(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validatorFunction: requiredValidator,
        validatorErrorMessage: 'State Required',
        inputFormatters: [
          FilteringTextInputFormatter.singleLineFormatter,
          LengthLimitingTextInputFormatter(3),
        ],
      ),
      SizedBox(height: 10),
      AuthFormField(
        valueKey: 'zipCode',
        labelText: 'Zip Code',
        initialValue: signupService.zip,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.go,
        textCapitalization: TextCapitalization.characters,
        onSavedFunction: (String value) {
          signupService.setBusinessZip(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validatorFunction: requiredValidator,
        validatorErrorMessage: 'Zip Code Required',
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(5),
        ],
      ),
      SizedBox(height: 20)
    ]);
  }
}
