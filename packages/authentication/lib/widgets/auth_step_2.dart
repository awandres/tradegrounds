import 'package:flutter/material.dart';

class AuthStep2 extends StatefulWidget {
  @override
  _AuthStep2State createState() => _AuthStep2State();
}

class _AuthStep2State extends State<AuthStep2> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(
        width: deviceSize.width,
        height: 300.0,
        child: const Card(child: Text('Map Here')),
      ),
      Column(
        children: [
          Text('Set a Delivery Radius',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Slider(
            value: 5.5,
            min: 1.0,
            max: 10.0,
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
            label: 'Set a radius',
            onChanged: (double newValue) {
              setState(() {
                newValue = newValue + 2;
              });
            },
          ),
        ],
      ),
    ]);
  }
}
