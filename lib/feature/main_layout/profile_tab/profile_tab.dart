import 'package:ecommercee/core/routes_manager/routes.dart';
import 'package:ecommercee/core/widget/shared_preference_utils.dart';
import 'package:flutter/material.dart';

class profile_tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconButton(
          onPressed: () {
            //todo: remove token
            SharedPreferenceUtils.removeData('token');
            //todo: navigate to login
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.signInRoute, (route) => false);
          },
          icon: Icon(Icons.logout)),
    );
  }
}
