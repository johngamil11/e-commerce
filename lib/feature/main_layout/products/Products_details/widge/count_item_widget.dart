import 'package:ecommercee/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommercee/feature/main_layout/cart/cubit/cart_screen_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';

class CountItemWidget extends StatelessWidget {
  GetProductsCartEntity cartEntity;

  CountItemWidget({required this.cartEntity});
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
              onPressed: () {
                int count = cartEntity.count!.toInt();
                count--;
                CartScreenViewModel.get(context)
                    .updateItemCountInCar(cartEntity.product!.id ?? '', count);
              },
              icon: Icon(
                Icons.remove_circle_outline,
                color: ColorManager.white,
              )),
          Text(
            cartEntity.count.toString(),
            style: TextStyle(color: ColorManager.white, fontSize: 18),
          ),
          IconButton(
              onPressed: () {
                int count = cartEntity.count!.toInt();
                count++;
                CartScreenViewModel.get(context)
                    .updateItemCountInCar(cartEntity.product!.id ?? '', count);
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: ColorManager.white,
              ))
        ],
      ),
    );
  }
}
