import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:custom_navigator/custom_scaffold.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitDualRing(
          lineWidth: 5,
          color: Colors.black,
          size: 50,
        ),
      ),
    );
  }
}
