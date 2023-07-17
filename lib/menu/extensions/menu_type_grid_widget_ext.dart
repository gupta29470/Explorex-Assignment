part of '../widgets/menu_type_grid_widget.dart';

extension on MenuTypeGridWidget {
  void menuTap(String? menuName, BuildContext context) {
    if (currentMenuValue != menuName) {
      currentMenuNotifier.value = menuName ?? "";
    }

    ProviderScope.containerOf(context, listen: false)
        .read(categoryProvider.notifier)
        .state = (-1, false);
  }
}
