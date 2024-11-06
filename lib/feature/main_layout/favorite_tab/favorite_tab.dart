import 'package:ecommercee/core/widget/custome_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widget/search_app_bar.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 95.h,
          actions: [
            SearchAppBar(),
          ],
        ),
        body: CustomeFavoriteItem(),
      ),
    );
  }
}
