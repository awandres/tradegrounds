import 'package:flutter/material.dart';
import 'package:authentication/docs/terms.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

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
    final terms = termsObject;
    print('terms object is $terms');

    return Column(
      children: [
        Container(
          height: deviceSize.height * 0.1,
          width: deviceSize.width * 1.1,
          // color: Colors.black,
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/tradegroundsIg.png',
                fit: BoxFit.,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'Effective since March 11th, 2021',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 10),
                      textAlign: TextAlign.right,
                    ),
                    ButtonTheme(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minWidth: 0,
                      height: 0,
                      child: FlatButton(
                        child: Text(
                          '< Back',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          textAlign: TextAlign.right,
                        ),
                        onPressed: signupService.handleBack,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          // controller: _scrollController,
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
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              terms["title"],
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            margin: EdgeInsets.only(bottom: 10, top: 0),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              terms["lastUpdated"],
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            margin: EdgeInsets.only(bottom: 20),
                          ),
                          Container(
                            child: Text(
                              terms["body"],
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.5,
                              ),
                            ),
                          ),
                        ],
                      ),
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
            isThreeLine: false,
            title: new Text(
              'I have read and agree to the terms and conditions',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            subtitle: !signupService.termsValid
                ? Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 10, 0, 0),
                    child: Text(
                      'Required field',
                      style: TextStyle(color: Color(0xFFe53935), fontSize: 12),
                    ),
                  )
                : null,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue),
      ],
    );
  }
}
