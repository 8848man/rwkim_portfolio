import 'package:flutter/material.dart';

class MyContentsBox extends StatelessWidget {
  final Widget child;
  const MyContentsBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.withOpacity(0.7),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
