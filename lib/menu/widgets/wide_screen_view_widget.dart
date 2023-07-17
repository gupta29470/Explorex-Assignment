import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/provider/category_provider.dart';
import 'package:explorex_assignment/menu/widgets/category_header_widget.dart';
import 'package:explorex_assignment/menu/widgets/food_detail_widget.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../extensions/wide_screen_view_widget_ext.dart';

class WideScreenViewWidget extends StatelessWidget {
  final Map<String, List<MenuItemModel?>> categories;
  final AnimationController expandController;
  final Animation<double> expandAnimation;

  const WideScreenViewWidget({
    super.key,
    required this.categories,
    required this.expandController,
    required this.expandAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        (int, bool) response = ref.watch(categoryProvider);
        int selectedCategoryValue = response.$1;

        // Handling Logics From Bottom Sheet Taps
        consumerRebuild(
          selectedCategoryValue: selectedCategoryValue,
          value: response.$2,
        );
        double currentWidth = MediaQuery.sizeOf(context).width;
        bool selectedValid = selectedCategoryValue >= 0;

        return Row(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: categories.values.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: selectedCategoryValue == index
                        ? DecorationHelper.categoryDecorSelected
                        : DecorationHelper.categoryDecor,
                    child: CategoryHeaderWidget(
                      totalFoodItems: categories.values.elementAt(index).length,
                      categoryTitle: categories.keys.elementAt(index),
                      isSelected: selectedCategoryValue == index,
                      expandAnimation: expandAnimation,
                      expandController: expandController,
                      index: index,
                      ref: ref,
                      selectedCategoryValue: selectedCategoryValue,
                      value: response.$2,
                      showDropDown: false,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: selectedValid
                  ? GridView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: selectedValid
                          ? categories.values
                              .elementAt(selectedCategoryValue)
                              .length
                          : 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridAxisCount(currentWidth),
                        childAspectRatio: gridChildAS(currentWidth),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (_, index) {
                        MenuItemModel? currentMenuItem = categories.values
                            .elementAt(selectedCategoryValue)[index];

                        if (currentMenuItem != null &&
                            currentMenuItem.id != null &&
                            currentMenuItem.id?.isNotEmpty == true &&
                            currentMenuItem.dish != null &&
                            currentMenuItem.dish?.name != null &&
                            currentMenuItem.dish?.name?.isNotEmpty == true &&
                            currentMenuItem.sellingPrice != null &&
                            currentMenuItem.displayPrice != null) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: DecorationHelper.categoryDecor,
                            child: Row(
                              children: [
                                Flexible(
                                  child: FoodDetailWidget(
                                    currentMenuItem: currentMenuItem,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return Center(
                          child: Text(
                            "Select category from left side",
                            style: TextThemeHelper.darkToneInk_16_600,
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "Select category from left side",
                        style: TextThemeHelper.darkToneInk_16_600,
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
