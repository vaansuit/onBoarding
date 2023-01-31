import 'package:flutter/material.dart';

class SlideableScreen extends StatelessWidget {
  final PageController controller;
  final List<Widget> children;

  const SlideableScreen({
    Key? key,
    required this.controller,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: children,
    );
  }
}
