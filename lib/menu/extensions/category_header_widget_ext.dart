part of '../widgets/category_header_widget.dart';

extension on CategoryHeaderWidget {
  void categoryTap({
    required int selectedCategoryValue,
    required bool value,
    required WidgetRef ref,
    required int index,
  }) {
    if (selectedCategoryValue == index) {
      if (value) {
        ref.read(categoryProvider.notifier).state = (index, false);
      }

      expandController.reverse().whenComplete(
            () => ref.read(categoryProvider.notifier).state = (-1, false),
          );
    } else {
      ref.read(categoryProvider.notifier).state = (index, false);

      if (expandAnimation.isCompleted) {
        expandController.reset();
      }
      expandController.forward();
    }
  }
}
