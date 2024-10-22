import 'package:flutter/material.dart';

class MyCardContainerBorderIndicator extends StatelessWidget {
  const MyCardContainerBorderIndicator({
    super.key,
    required this.child,
    this.colorIndicator = Colors.white,
  });

  final Widget child;
  final Color colorIndicator;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      elevation: 2,
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                // color: MyUtils.statusColor(booking.bookingStateId!),
                color: colorIndicator,
                width: 8,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
