import 'package:flutter/material.dart';

class ContenedorRectangle extends StatelessWidget {
  final Widget child;
  const ContenedorRectangle({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Center(
        child: child,
      ),
    );
  }
}
