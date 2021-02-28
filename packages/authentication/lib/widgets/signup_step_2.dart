import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:authentication/widgets/auth_form_field.dart';

import 'package:authentication/controllers/phone_controller.dart';
import 'package:authentication/providers/signup_provider.dart';
import 'package:authentication/docs/business_categories.dart';

class SignupStep2 extends StatefulWidget {
  @override
  _SignupStep2State createState() => _SignupStep2State();
}

class _SignupStep2State extends State<SignupStep2> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final signupService = Provider.of<AuthProvider>(context);
    var maskedController = MaskedTextController(
        mask: '(000) 000-0000', text: signupService.phoneNumber);

    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          'Business Information',
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        AuthFormField(
          valueKey: 'storename',
          labelText: 'Business Name',
          initialValue: signupService.storeName,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          onSavedFunction: (String value) {
            signupService.changeStoreName(value);
          },
          validatorFunction: requiredValidator,
          validatorErrorMessage: 'Please enter a store name',
        ),
        SizedBox(height: 10),
        Material(
          elevation: 5.0,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
          child: DropdownButtonFormField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.8),
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w700,
            ),
            hint: signupService.businessCategory == null
                ? Text('Business Category')
                : Text(
                    signupService.businessCategory,
                  ),
            onChanged: (value) => {
              signupService.changeBusinessCategory(value),
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(10.5),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
            ),
            isExpanded: true,
            iconSize: 30.0,
            items: categories.map(
              (value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ),
        SizedBox(height: 10),
        AuthFormField(
          valueKey: 'phoneNumber',
          labelText: 'Business Phone Number',
          // initialValue: signupService.phoneNumber,
          fieldController: maskedController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.go,
          onSavedFunction: (String value) {
            signupService.changeBusinessPhoneNumber(value);
          },
          validatorFunction: phoneNumberValidator,
          validatorErrorMessage: 'Please enter a valid phone number',
        ),
        //
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
