import 'package:flutter/material.dart';

class CustomeSectionBar extends StatelessWidget {
  String title;

  Function function;

  CustomeSectionBar({required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          TextButton(onPressed: function(), child: Text('View all'))
        ],
      ),
    );
  }
}
