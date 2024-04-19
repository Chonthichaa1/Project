import 'package:flutter/material.dart';

class SharePage extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const SharePage({required this.backgroundColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor.withOpacity(0.5),
      child: child,
    );
  }
}

void showPopup(BuildContext context, Color backgroundColor, Widget child) {
  showDialog(
    context: context,
    builder: (BuildContext context) => SharePage(backgroundColor: backgroundColor, child: child),
  );
}
