import 'package:flutter/material.dart';
import 'package:authentication/docs/terms.dart';

class AuthStep3 extends StatefulWidget {
  @override
  _AuthStep3State createState() => _AuthStep3State();
}

class _AuthStep3State extends State<AuthStep3> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: (deviceSize.height * 0.5),
            ),
            child: ListView(controller: _scrollController, children: [
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
            ]),
          ),
        ),
      ],
    );
  }
}
