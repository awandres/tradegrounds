import 'package:flutter/material.dart';
import 'package:authentication/docs/terms.dart';
import 'package:provider/provider.dart';

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

    return Column(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: (deviceSize.height * 0.5),
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
                      child: Text('Terms & Agreements'),
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
            value: authService.termsAgreed,
            onChanged: authService.changeTermsAgreed,
            title:
                new Text('I have read and agree to the terms and conditions'),
            subtitle: !authService.termsValid
                ? Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 10, 0, 0),
                    child: Text(
                      'Required field',
                      style: TextStyle(color: Color(0xFFe53935), fontSize: 12),
                    ),
                  )
                : null,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue)
      ],
    );
  }
}
