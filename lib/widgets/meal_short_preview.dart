import 'package:flutter/material.dart';

class MealShortPreview extends StatelessWidget {
  final String data;
  final IconData icon;

  MealShortPreview(this.data, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(data)
      ],
    );
  }
}
