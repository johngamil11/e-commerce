import 'package:ecommercee/core/routes_manager/route_generator.dart';
import 'package:ecommercee/core/routes_manager/routes.dart';
import 'package:ecommercee/core/widget/shared_preference_utils.dart';
import 'package:ecommercee/feature/auth/register/register_screen.dart';
import 'package:ecommercee/feature/main_layout/cart/cubit/cart_screen_view_model.dart';
import 'package:ecommercee/feature/main_layout/favorite_tab/cubit/wishlist_view_model.dart';
import 'package:ecommercee/feature/main_layout/home_screen/cubit/home_tab_view_model.dart';
import 'package:ecommercee/feature/main_layout/products/cubit/product_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'domain/di/di.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  // var token = SharedPreferenceUtils.getData(key: 'token');
  // String route;
  // if (token == null) {
  //   route = Routes.signInRoute;
  // } else {
  //   route = Routes.mainRoute;
  // }
  runApp(
      // MyApp());
      MultiBlocProvider(providers: [
    BlocProvider<HomeTabViewModel>(
      create: (context) => getIt<HomeTabViewModel>(),
    ),
    BlocProvider<CartScreenViewModel>(
      create: (context) => getIt<CartScreenViewModel>(),
    ),
    BlocProvider<ProductScreenViewModel>(
      create: (context) => getIt<ProductScreenViewModel>(),
    ),
    BlocProvider<WishListViewModel>(
      create: (context) => getIt<WishListViewModel>(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // String route ;
  MyApp();
  @override
  Widget build(BuildContext context) {
    var token = SharedPreferenceUtils.loadData('token');
    print(token);

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          initialRoute: token == null ? Routes.signInRoute : Routes.mainRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
    );
    ;
  }
}
