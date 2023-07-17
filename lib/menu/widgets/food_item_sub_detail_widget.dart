import 'package:explorex_assignment/common/functions/common_functions.dart';
import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/widgets/food_item_detail_bottom_sheet_widget.dart';
import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';

class FoodItemSubDetailWidget extends StatelessWidget {
  final MenuItemModel currentMenuItem;

  const FoodItemSubDetailWidget({
    super.key,
    required this.currentMenuItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColorHelper.transparent,
          builder: (_) {
            return FoodItemDetailBottomWidget(
              menuItemModel: currentMenuItem,
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (currentMenuItem.dish?.meatStatus != null &&
                  currentMenuItem.category?.isNotEmpty == true) ...[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: Image.asset(
                    getMeatTypeImage(
                      currentMenuItem.dish?.meatStatus ?? "",
                    ),
                    height: 16,
                    width: 16,
                  ),
                ),
              ]
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 6,
            ),
            child: Text(
              "${currentMenuItem.dish?.name}",
              style: TextThemeHelper.darkToneInk_14_600,
            ),
          ),
          if (currentMenuItem.dish?.description != null &&
              currentMenuItem.dish?.description?.isNotEmpty == true) ...[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      (currentMenuItem.dish?.description?.length ?? 0) > 16
                          ? "${currentMenuItem.dish?.description?.substring(0, 16)}...  "
                          : "${currentMenuItem.dish?.description}...  ",
                      style: TextThemeHelper.chromeAluminium_10_400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "read more",
                    style: TextThemeHelper.chromeAluminium_10_700,
                  ),
                ],
              ),
            ),
          ],
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                  ),
                  child: Text(
                    "Rs ${currentMenuItem.sellingPrice}",
                    style: TextThemeHelper.darkToneInk_10_600,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "Rs ${currentMenuItem.displayPrice}",
                  style: TextThemeHelper.darkToneInk_9_400_lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
