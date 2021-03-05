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
    final signupService = Provider.of<SignupProvider>(context);
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: deviceSize.height * 0.07,
          width: deviceSize.width * 1.1,
          // color: Colors.black,
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/tradegroundsIg.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          controller: _scrollController,
          child: Material(
            elevation: 5.0,
            shadowColor: Colors.black,
            borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: (deviceSize.height * 0.5),
              ),
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                radius: Radius.circular(20.0),
                child: ListView(
                  controller: _scrollController,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Text(termsText),
                          padding: EdgeInsets.only(left: 20, right: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CheckboxListTile(
            value: signupService.termsAgreed,
            onChanged: signupService.changeTermsAgreed,
            title: new Text(
              'I have read and agree to the terms and conditions',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue),
        if (!signupService.termsValid)
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 10, 0, 0),
            child: Text(
              'Required field',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFe53935),
                  fontSize: 12),
            ),
          ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
