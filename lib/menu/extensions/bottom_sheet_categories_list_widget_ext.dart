part of '../widgets/bottom_sheet_categories_list_widget.dart';

extension on BottomSheetCategoriesListWidget {
  void categoryTap({
    required WidgetRef ref,
    required BuildContext context,
    required int index,
  }) {
    ref.read(categoryProvider.notifier).state = (index, true);
    ProviderScope.containerOf(context, listen: false)
        .read(categorySCProvider)
        .scrollTo(
          index: index,
          duration: const Duration(milliseconds: 600),
        );
    Navigator.pop(context);
  }
}
