// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MySizedBoxHeight extends StatelessWidget {
  final double? kDouble;

  const MySizedBoxHeight({this.kDouble = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: (kDouble!));
  }
}

class MySizedBoxWidth extends StatelessWidget {
  final double? kDouble;

  const MySizedBoxWidth({this.kDouble = 10});
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: (kDouble!));
  }
}
