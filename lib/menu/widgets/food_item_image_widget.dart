import 'package:cached_network_image/cached_network_image.dart';
import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/resources/resource.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:flutter/material.dart';

class FoodItemImageWidget extends StatelessWidget {
  final MenuItemModel currentMenuItem;

  const FoodItemImageWidget({
    super.key,
    required this.currentMenuItem,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: currentMenuItem.dish?.image ?? "",
      imageBuilder: (_, imageProvider) {
        return SizedBox(
          height: 100,
          width: 100,
          child: DecoratedBox(
            decoration: DecorationHelper.foodItemImageDecor(
              currentMenuItem.dish?.image ?? "",
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return SizedBox(
          height: 100,
          width: 100,
          child: DecoratedBox(
            decoration: DecorationHelper.foodItemImagePlaceHolderDecor(
              Images.menuBG,
            ),
          ),
        );
      },
    );
  }
}
