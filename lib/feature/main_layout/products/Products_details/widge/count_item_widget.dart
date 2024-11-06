import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';

class CountItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorManager.primary,
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_circle_outline,
                color: ColorManager.white,
              )),
          Text(
            '5',
            style: TextStyle(color: ColorManager.white, fontSize: 18),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_circle_outline,
                color: ColorManager.white,
              ))
        ],
      ),
    );
  }
}
