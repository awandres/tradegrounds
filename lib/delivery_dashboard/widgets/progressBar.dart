import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  String label;
  String spendingAmount;
  String spendingPctOfTotal;

  // ProgressBar();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            // Container(
            //   child:
            //     FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
            //   height: constraints.maxHeight * 0.15,
            // ),
            // SizedBox(
            //   height: constraints.maxHeight * 0.05,
            // ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text('asdas'))
            )
          ],
        );
      },
    );
  }
}
