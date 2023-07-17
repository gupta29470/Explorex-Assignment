import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/provider/category_provider.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../extensions/bottom_sheet_categories_list_widget_ext.dart';

class BottomSheetCategoriesListWidget extends StatelessWidget {
  final Map<String, List<MenuItemModel?>> categories;

  const BottomSheetCategoriesListWidget({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          bottom: 60,
        ),
        itemCount: categories.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          String currentCategory = categories.keys.elementAt(index);

          int currentCategoryLength = categories.values.elementAt(index).length;

          return Consumer(
            builder: (_, ref, __) {
              (int, bool) response = ref.watch(categoryProvider);

              return InkWell(
                onTap: () {
                  categoryTap(
                    context: context,
                    ref: ref,
                    index: index,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: response.$1 == index
                      ? DecorationHelper.bsCategorySelectedDecor
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 16,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 12,
                                ),
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: DecoratedBox(
                                    decoration: DecorationHelper
                                        .bsCategoryCircleOutlinedDecor,
                                    child: response.$1 == index
                                        ? Center(
                                            child: SizedBox(
                                              height: 10,
                                              width: 10,
                                              child: DecoratedBox(
                                                decoration: DecorationHelper
                                                    .bsCategoryCircleFilledDecor,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  currentCategory,
                                  style: response.$1 == index
                                      ? TextThemeHelper.hooloovooBlue_12_700
                                      : TextThemeHelper.darkToneInk_12_400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "($currentCategoryLength)",
                        style: response.$1 == index
                            ? TextThemeHelper.hooloovooBlue_12_700
                            : TextThemeHelper.darkToneInk_12_400,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
