import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/widgets/bottom_sheet_categories_list_widget.dart';
import 'package:explorex_assignment/menu/widgets/menu_type_grid_widget.dart';
import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';

class ViewCategoryBottomSheetWidget extends StatelessWidget {
  final Map<String, Map<String, Map<String, List<MenuItemModel?>>>>?
      meatTypeData;
  final Map<String, Map<String, List<MenuItemModel?>>>? categoriesData;
  final List<MenuTypeModel?>? menus;
  final ValueNotifier<String> currentMenuNotifier;
  final ValueNotifier<String> currentMeatTypeNotfier;

  const ViewCategoryBottomSheetWidget({
    super.key,
    required this.meatTypeData,
    required this.categoriesData,
    required this.menus,
    required this.currentMeatTypeNotfier,
    required this.currentMenuNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(16),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel_outlined,
                color: AppColorHelper.white,
                size: 24,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: currentMenuNotifier,
              builder: (_, currentMenuValue, __) {
                return ValueListenableBuilder<String>(
                  valueListenable: currentMeatTypeNotfier,
                  builder: (_, currentMeatValue, __) {
                    Map<String, List<MenuItemModel?>> categories =
                        currentMeatValue.isNotEmpty
                            ? (meatTypeData?[currentMenuValue]
                                    ?[currentMeatValue] ??
                                {})
                            : (categoriesData?[currentMenuValue] ?? {});
                    return Container(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                      decoration: DecorationHelper.bsWhiteDecor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 16,
                            ),
                            child: Text(
                              "MENU TYPE (${menus?.length})",
                              style: TextThemeHelper.chromeAluminium_12_600,
                            ),
                          ),
                          MenuTypeGridWidget(
                            menus: menus,
                            currentMenuValue: currentMenuValue,
                            currentMenuNotifier: currentMenuNotifier,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 24,
                              bottom: 16,
                            ),
                            child: Text(
                              "Categories (${categories.length})",
                              style: TextThemeHelper.chromeAluminium_12_600,
                            ),
                          ),
                          BottomSheetCategoriesListWidget(
                            categories: categories,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
