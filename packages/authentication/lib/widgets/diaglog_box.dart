import 'dart:ui';
// import 'package:custom_dialog_flutter_demo/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, errorMsg, btnText;

  const CustomDialogBox({
    Key key,
    this.title,
    this.errorMsg,
    this.btnText,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
            // borderRadius: Radius.,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                widget.errorMsg,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  child: Text(
                    widget.btnText,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 8.0),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryTextTheme.button.color,
                ),
              ),
              SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            // height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8)
              ),
              color: Colors.amber,
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.title,
            )
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      backgroundColor: Colors.amber,
      child: contentBox(context),
    );
  }
}
