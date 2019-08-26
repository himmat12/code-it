import 'package:flutter/material.dart';

class BottomIcons extends StatelessWidget {
  final Icon icon;
  BottomIcons(this.icon);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: icon,
      color: Colors.white,
    );
  }
}
