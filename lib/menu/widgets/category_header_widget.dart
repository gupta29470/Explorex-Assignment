import 'package:explorex_assignment/menu/provider/category_provider.dart';
import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../extensions/category_header_widget_ext.dart';

class CategoryHeaderWidget extends StatelessWidget {
  final String categoryTitle;
  final int totalFoodItems;
  final bool isSelected;
  final AnimationController expandController;
  final Animation<double> expandAnimation;
  final int index;
  final WidgetRef ref;
  final bool value;
  final int selectedCategoryValue;
  final bool showDropDown;

  const CategoryHeaderWidget({
    super.key,
    required this.totalFoodItems,
    required this.categoryTitle,
    required this.isSelected,
    required this.expandAnimation,
    required this.expandController,
    required this.index,
    required this.ref,
    required this.selectedCategoryValue,
    required this.value,
    this.showDropDown = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        categoryTap(
          index: index,
          ref: ref,
          selectedCategoryValue: selectedCategoryValue,
          value: value,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  categoryTitle,
                  style: TextThemeHelper.darkToneInk_12_600,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "$totalFoodItems items",
                  style: TextThemeHelper.chromeAluminium_12_400,
                ),
                const SizedBox(width: 16),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: DecoratedBox(
                    decoration: DecorationHelper.categoryHeaderIconDecor,
                    child: Center(
                      child: Icon(
                        !showDropDown
                            ? Icons.keyboard_arrow_right
                            : isSelected
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                        size: 20,
                        color: AppColorHelper.black,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
