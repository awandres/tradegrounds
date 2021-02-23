import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:authentication/widgets/auth_form_field.dart';

import 'package:authentication/controllers/phone_controller.dart';
import 'package:authentication/providers/auth_provider.dart';
import 'package:authentication/docs/business_categories.dart';

class SignupStep2 extends StatefulWidget {
  @override
  _SignupStep2State createState() => _SignupStep2State();
}

class _SignupStep2State extends State<SignupStep2> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final authService = Provider.of<AuthProvider>(context);
    var maskedController = MaskedTextController(mask: '(000) 000-0000');

    String _dropDownValue;

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
          keyboardType: TextInputType.name,
          actionKeyboard: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          onSavedFunction: (String value) {
            authService.changeStoreName(value);
          },
          validatorFunction: requiredValidator,
          validatorErrorMessage: 'Please enter a store name',
        ),
        SizedBox(height: 10),
        DropdownButtonFormField(
          hint: authService.businessCategory == null
              ? Text('Business Category')
              : Text(
                  authService.businessCategory,
                ),
          onChanged: (value) => {
            authService.changeBusinessCategory(value),
            setState(() {}),
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(10.5),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
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
        SizedBox(height: 10),
        AuthFormField(
          valueKey: 'phoneNumber',
          labelText: 'Business Phone Number',
          fieldController: maskedController,
          keyboardType: TextInputType.phone,
          actionKeyboard: TextInputAction.go,
          onSavedFunction: (String value) {
            authService.changeBusinessPhoneNumber(value);
          },
          validatorFunction: phoneNumberValidator,
          validatorErrorMessage: 'Please enter a valid phone number',
        ),
        // TextFormField(
        //   controller: maskedController,
        //   autofocus: false,
        //   decoration: InputDecoration(
        //     isDense: true,
        //     labelText: "Business Phone Number",
        //     border: OutlineInputBorder(
        //       borderRadius: const BorderRadius.all(
        //         const Radius.circular(20.0),
        //       ),
        //     ),
        //   ),
        //   key: ValueKey('phoneNumber'),
        //   validator: (value) {
        //     if (value.isEmpty) {
        //       return 'Please enter a phone number';
        //     }
        //     return null;
        //   },
        //   // inputFormatters: [
        //   //   FilteringTextInputFormatter.digitsOnly,
        //   //   LengthLimitingTextInputFormatter(10),
        //   // ],
        //   keyboardType: TextInputType.phone,
        //   onSaved: (String value) {
        //     authService.changeBusinessPhoneNumber(value);
        //   },
        // ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
