import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/provider/category_provider.dart';
import 'package:explorex_assignment/menu/widgets/category_header_widget.dart';
import 'package:explorex_assignment/menu/widgets/food_detail_widget.dart';
import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../extensions/category_widget_ext.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryTitle;
  final List<MenuItemModel?> categoryMenuList;
  final int index;
  final AnimationController expandController;
  final Animation<double> expandAnimation;

  const CategoryWidget({
    super.key,
    required this.categoryMenuList,
    required this.categoryTitle,
    required this.index,
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

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: DecorationHelper.categoryDecor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Category Title
              CategoryHeaderWidget(
                totalFoodItems: categoryMenuList.length,
                categoryTitle: categoryTitle,
                isSelected: selectedCategoryValue == index,
                expandAnimation: expandAnimation,
                expandController: expandController,
                index: index,
                value: response.$2,
                ref: ref,
                selectedCategoryValue: selectedCategoryValue,
              ),
              // Food Dish In Current Category
              if (index == selectedCategoryValue) ...[
                SizeTransition(
                  sizeFactor: expandAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(
                        color: AppColorHelper.lilacChampagne,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: categoryMenuList.length,
                                itemBuilder: (_, index) {
                                  MenuItemModel? currentMenuItem =
                                      categoryMenuList[index];

                                  if (currentMenuItem != null &&
                                      currentMenuItem.id != null &&
                                      currentMenuItem.id?.isNotEmpty == true &&
                                      currentMenuItem.dish != null &&
                                      currentMenuItem.dish?.name != null &&
                                      currentMenuItem.dish?.name?.isNotEmpty ==
                                          true &&
                                      currentMenuItem.sellingPrice != null &&
                                      currentMenuItem.displayPrice != null) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 16,
                                            top: index != 0 ? 16 : 0,
                                          ),
                                          child: FoodDetailWidget(
                                            currentMenuItem: currentMenuItem,
                                          ),
                                        ),
                                        if (index <
                                            categoryMenuList.length - 1) ...[
                                          const Divider(
                                            color:
                                                AppColorHelper.lilacChampagne,
                                          ),
                                        ]
                                      ],
                                    );
                                  }
                                  return const Text("FUDDU");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
