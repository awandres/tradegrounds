import 'package:flutter/material.dart';
import 'package:authentication/docs/terms.dart';
import 'package:provider/provider.dart';

import 'package:authentication/providers/signup_provider.dart';

class SignupStep4 extends StatefulWidget {
  @override
  _SignupStep4State createState() => _SignupStep4State();
}

class _SignupStep4State extends State<SignupStep4> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final signupService = Provider.of<AuthProvider>(context);
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: (deviceSize.height * 0.6),
            ),
            child: ListView(
              controller: _scrollController,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      // A fixed-height child.
                      alignment: Alignment.center,
                      child: Text(
                        'Terms and Conditions',
                        style: Theme.of(context).textTheme.title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(termsText),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        CheckboxListTile(
            value: signupService.termsAgreed,
            onChanged: signupService.changeTermsAgreed,
            title: new Text(
              'I have read and agree to the terms and conditions',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: !signupService.termsValid
                ? Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 10, 0, 0),
                    child: Text(
                      'Required field',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFe53935),
                          fontSize: 12),
                    ),
                  )
                : null,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue)
      ],
    );
  }
}
