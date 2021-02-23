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
