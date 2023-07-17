import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/widgets/cart_button_widget.dart';
import 'package:explorex_assignment/menu/widgets/food_item_image_widget.dart';
import 'package:explorex_assignment/menu/widgets/food_item_sub_detail_widget.dart';
import 'package:flutter/material.dart';

class FoodDetailWidget extends StatelessWidget {
  final MenuItemModel currentMenuItem;

  const FoodDetailWidget({
    super.key,
    required this.currentMenuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: currentMenuItem.dish?.hasImage == true
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FoodItemSubDetailWidget(
            currentMenuItem: currentMenuItem,
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          height: currentMenuItem.dish?.hasImage == true ? 120 : 32,
          width: 116,
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              if (currentMenuItem.dish?.hasImage == true) ...[
                FoodItemImageWidget(
                  currentMenuItem: currentMenuItem,
                ),
              ],
              Positioned(
                bottom: currentMenuItem.dish?.hasImage == true ? 12 : 0,
                child: CartButtonWidget(
                  currentMenuItem: currentMenuItem,
                  height: 32,
                  width: 116,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
