part of '../widgets/bottom_sheet_categories_list_widget.dart';

extension on BottomSheetCategoriesListWidget {
  void categoryTap({
    required WidgetRef ref,
    required BuildContext context,
    required int index,
  }) {
    ref.read(categoryProvider.notifier).state = (index, true);
    Navigator.pop(context);
  }
}
