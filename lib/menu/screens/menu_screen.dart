import 'package:explorex_assignment/common/constants/app_constants.dart';
import 'package:explorex_assignment/common/extension/extensions.dart';
import 'package:explorex_assignment/common/functions/common_functions.dart';
import 'package:explorex_assignment/menu/cubit/menu_cubit.dart';
import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/provider/category_provider.dart';
import 'package:explorex_assignment/menu/widgets/categories_widget.dart';
import 'package:explorex_assignment/menu/widgets/meat_type_widget.dart';
import 'package:explorex_assignment/menu/widgets/view_categories_bottom_sheet_widget.dart';
import 'package:explorex_assignment/menu/widgets/view_order_widget.dart';
import 'package:explorex_assignment/resources/resource.dart';
import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:explorex_assignment/styles/button_theme/button_theme_helper.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../extensions/menu_screen_ext.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  ValueNotifier<String> currentMenuNotifier = ValueNotifier<String>("");
  ValueNotifier<String> currentMeatTypeNotfier = ValueNotifier<String>("");

  @override
  void didChangeDependencies() {
    context.menuCubit.getMenus();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.lavenderSyrup,
      body: SafeArea(
        child: BlocBuilder<MenuCubit, MenuState>(
          builder: (_, state) {
            if (state.menuCubitStatus.isInitial ||
                state.menuCubitStatus.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.menuCubitStatus.isSuccess) {
              Map<String, Map<String, Map<String, List<MenuItemModel?>>>>?
                  meatTypeData = state.menusModel.description?.meatTypeData;

              Map<String, Map<String, List<MenuItemModel?>>>? categoriesData =
                  state.menusModel.description?.categoriesData;

              currentMenuNotifier.value = meatTypeData?.keys.elementAt(0) ?? "";

              List<String> meatTypes =
                  meatTypeData?[currentMenuNotifier.value]?.keys.toList() ?? [];

              return Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        decoration: DecorationHelper.logoBoxDecor,
                        alignment: Alignment.center,
                        child: Image.asset(
                          Images.explorexLogo,
                          height: 24,
                          width: 86,
                        ),
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: currentMenuNotifier,
                          builder: (_, currentMenuValue, __) {
                            int recommendedLength =
                                categoriesData?[currentMenuValue]
                                            ?[CategoryConstants.recommended]
                                        ?.length ??
                                    0;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Meat Type
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12.5,
                                  ),
                                  decoration: DecorationHelper.meatTypesDecor,
                                  child: Wrap(
                                    runSpacing: 16,
                                    spacing: 8,
                                    children: List.generate(
                                      meatTypes.length,
                                      (index) => InkWell(
                                        onTap: () {
                                          meatTypeTap(meatTypes[index]);
                                        },
                                        child: ValueListenableBuilder<String>(
                                          valueListenable:
                                              currentMeatTypeNotfier,
                                          builder: (_, currentMeatValue, __) {
                                            // Checking current meat's category length
                                            int categoryLength = meatTypeData?[
                                                            currentMenuNotifier
                                                                .value]
                                                        ?[meatTypes[index]]
                                                    ?.length ??
                                                0;
                                            if (categoryLength > 0) {
                                              return MeatTypeWidget(
                                                image: getMeatTypeImage(
                                                  meatTypes[index],
                                                ),
                                                meatType: meatTypes[index],
                                                selectedMeatType:
                                                    currentMeatValue,
                                              );
                                            }
                                            return const SizedBox.shrink();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Recommended Information
                                if (recommendedLength > 0) ...[
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: DecorationHelper
                                        .recommendedInformationDecor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Recommended in Food Menu",
                                          style: TextThemeHelper
                                              .darkToneInk_10_400,
                                        ),
                                        Text(
                                          "($recommendedLength) items",
                                          style: TextThemeHelper
                                              .forgedSteel_10_400,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],

                                // Categories List
                                ValueListenableBuilder<String>(
                                  valueListenable: currentMeatTypeNotfier,
                                  builder: (_, currentMeatValue, __) {
                                    return CategoriesWidget(
                                      categories: currentMeatValue.isNotEmpty
                                          ? (meatTypeData?[currentMenuValue]
                                                  ?[currentMeatValue] ??
                                              {})
                                          : (categoriesData?[
                                                  currentMenuValue] ??
                                              {}),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // View Categories Floating Button
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          child: ElevatedButton(
                            style: ButtonThemeHelper.viewCategoriesButtonStyle,
                            onPressed: () {
                              viewCategoiresTap(
                                meatTypeData: meatTypeData,
                                categoriesData: categoriesData,
                                menus: state.menusModel.description?.menus,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.menu_book_outlined,
                                    color: AppColorHelper.white,
                                    size: 12,
                                  ),
                                ),
                                Text(
                                  "View Categories",
                                  style: TextThemeHelper.white_10_600,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Order Info
                        const ViewOrderWidget(),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: Text(
                "Refresh Page",
                style: TextThemeHelper.darkToneInk_16_600,
              ),
            );
          },
        ),
      ),
    );
  }
}
