import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthFormField extends StatefulWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isDense;
  final String labelText;
  final String initialValue;
  final String valueKey;
  final AutovalidateMode autovalidateMode;
  final TextEditingController controller;
  final Function validatorFunction;
  final String validatorErrorMessage;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextEditingController fieldController;
  final Function onFieldSubmitted;
  final Function onSavedFunction;
  final Function onChangedFunction;
  final List<TextInputFormatter> inputFormatters;

  const AuthFormField({
    this.isDense = true,
    this.initialValue,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.labelText,
    this.valueKey,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    this.onFieldSubmitted,
    this.validatorFunction,
    this.validatorErrorMessage,
    this.onSavedFunction,
    this.onChangedFunction,
    this.fieldController,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
  });

  @override
  _AuthFormFieldState createState() => _AuthFormFieldState();
}

var passwordToMatch;

class _AuthFormFieldState extends State<AuthFormField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shadowColor: Colors.black,
      borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
      child: TextFormField(
        autovalidateMode: widget.autovalidateMode,
        initialValue: widget.initialValue,
        controller: widget.fieldController,
        obscureText: widget.obscureText,
        onFieldSubmitted: widget.onFieldSubmitted,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
          ),
          isDense: widget.isDense,
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
        ),
        textCapitalization: widget.textCapitalization,
        key: ValueKey(widget.valueKey),
        validator: (value) {
          return widget.validatorFunction(value, widget.validatorErrorMessage);
        },
        keyboardType: widget.keyboardType,
        onSaved: widget.onSavedFunction,
      ),
    );
  }
}

String emailValidation(value, validatorErrorMessage) {
  print('running email validator');

  if (value.isEmpty || !value.contains('@')) {
    return validatorErrorMessage;
  }
  return null;
}

String noValidation(value, validatorErrorMessage) {
  return null;
}

String requiredValidator(value, validatorErrorMessage) {
  print('running required validator');
  if (value.isEmpty) {
    return validatorErrorMessage;
  }
  return null;
}

String passwordValidator(value, validatorErrorMessage) {
  print('running password validator');

  passwordToMatch = value;
  if (value.isEmpty || value.length < 7) {
    return validatorErrorMessage;
  }
  return null;
}

String passwordMatchValidator(value, validatorErrorMessage) {
  if (value.isEmpty || value != passwordToMatch) {
    return validatorErrorMessage;
  }
  return null;
}

String phoneNumberValidator(value, validatorErrorMessage) {
  print('running phone validator and length is ${value.length}');

  if (value.isEmpty || value.length < 14) {
    return validatorErrorMessage;
  }
  return null;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
