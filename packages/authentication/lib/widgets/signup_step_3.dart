import 'package:flutter/material.dart';
import 'package:authentication/docs/terms.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:authentication/providers/auth_provider.dart';

class SignupStep3 extends StatefulWidget {
  @override
  _SignupStep3State createState() => _SignupStep3State();
}

class _SignupStep3State extends State<SignupStep3> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthProvider>(context);
    final deviceSize = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(height: 50),
      Text(
        'Business Location',
        style: Theme.of(context).textTheme.title,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 30),
      TextFormField(
        decoration: InputDecoration(
          isDense: true,
          labelText: "Street Address",
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        textCapitalization: TextCapitalization.words,
        key: ValueKey('streetAddress'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter an address';
          }
          return null;
        },
        keyboardType: TextInputType.streetAddress,
        onSaved: (String value) {
          authService.setBusinessStreetAddress(value);
        },
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        key: ValueKey('unit'),
        decoration: InputDecoration(
          isDense: true,
          labelText: 'Unit, Apartment, etc.',
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        onSaved: (String value) {
          authService.setBusinessAddressUnit(value);
        },
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        key: ValueKey('city'),
        validator: (value) {
          if (value.isEmpty) {
            return 'City Required';
          }
          return null;
        },
        decoration: InputDecoration(
          isDense: true,
          labelText: 'City',
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        onSaved: (String value) {
          authService.setBusinessCity(value);
        },
      ),
      SizedBox(height: 10),
      TextFormField(
        key: ValueKey('state'),
        validator: (value) {
          if (value.isEmpty) {
            return 'State Required';
          }
          return null;
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(2),
        ],
        textCapitalization: TextCapitalization.characters,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          labelText: 'State',
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        onSaved: (String value) {
          authService.setBusinessState(value);
        },
      ),
      SizedBox(height: 10),
      TextFormField(
        key: ValueKey('zipCode'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Zip Code Required';
          }
          return null;
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(5),
        ],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          isDense: true,
          labelText: 'Zip Code',
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        onSaved: (String value) {
          authService.setBusinessZip(value);
        },
      ),
      SizedBox(
        height: 20,
      )
    ]);
  }
}
