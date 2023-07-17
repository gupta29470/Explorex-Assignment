part of '../screens/menu_screen.dart';

extension on _MenuScreenState {
  void meatTypeTap(String value) {
    ProviderScope.containerOf(context, listen: false)
        .read(categoryProvider.notifier)
        .state = (-1, false);

    if (currentMeatTypeNotfier.value == value) {
      currentMeatTypeNotfier.value = "";
    } else {
      currentMeatTypeNotfier.value = value;
    }
  }

  void viewCategoiresTap({
    required Map<String, Map<String, Map<String, List<MenuItemModel?>>>>?
        meatTypeData,
    required Map<String, Map<String, List<MenuItemModel?>>>? categoriesData,
    required List<MenuTypeModel?>? menus,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColorHelper.transparent,
      context: context,
      builder: (bottomContext) {
        return ViewCategoryBottomSheetWidget(
          meatTypeData: meatTypeData,
          categoriesData: categoriesData,
          currentMeatTypeNotfier: currentMeatTypeNotfier,
          currentMenuNotifier: currentMenuNotifier,
          menus: menus,
        );
      },
    );
  }
}
