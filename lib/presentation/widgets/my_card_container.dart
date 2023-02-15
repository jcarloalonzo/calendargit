import 'package:calendario/core/config/palette.dart';
import 'package:flutter/material.dart';

class MyCardContainer extends StatelessWidget {
  final bool padding;
  final Widget? child;
  final Color backgroundColor;
  final double elevation;
  const MyCardContainer(
      {Key? key,
      this.child,
      this.padding = true,
      this.elevation = 2,
      this.backgroundColor = Palette.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: double.infinity,
    //   padding: (padding) ? EdgeInsets.all(14) : EdgeInsets.zero,
    //   margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
    //   decoration: new BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(10),
    //     ),
    //     boxShadow: [
    //       new BoxShadow(
    //         color: Colors.grey.shade300,
    //         offset: new Offset(0.0, 0.8),
    //         blurRadius: 2.0,
    //       ),
    //     ],
    //   ),
    //   child: child,
    // );
    return Padding(
      padding: const EdgeInsets.only(top:16.0),
      child: Card(
        color: backgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: (padding) ? const EdgeInsets.all(14) : EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
