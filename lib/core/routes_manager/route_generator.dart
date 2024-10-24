import 'package:ecommercee/core/routes_manager/routes.dart';
import 'package:ecommercee/feature/auth/login/login_screen.dart';
import 'package:ecommercee/feature/auth/register/register_screen.dart';
import 'package:ecommercee/feature/main_layout/main_layout.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.cartRoute:
      //   return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainLayout());
      //
      // case Routes.productsScreenRoute:
      //   return MaterialPageRoute(builder: (_) => ProductsScreen());
      //
      // // case Routes.productDetails:
      // //   return MaterialPageRoute(builder: (_) =>  ProductDetails());
      //
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      //
      // case Routes.splashScreenRoute:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => Register_screen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
