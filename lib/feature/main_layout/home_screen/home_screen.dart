import 'package:ecommercee/core/widget/custome_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widget/search_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 95.h,
        actions: [
          SearchAppBar(),
        ],
      ),
      body: Column(
        children: [
          CustomeSlider(),
        ],
      ),
    );
  }
}
