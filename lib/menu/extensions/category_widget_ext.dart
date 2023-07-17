part of '../widgets/category_widget.dart';

extension on CategoryWidget {
  void consumerRebuild({
    required int selectedCategoryValue,
    required bool value,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // when changing meat type
      if (selectedCategoryValue >= 0 && expandController.isCompleted) {
        expandController.reset();
      }

      // when changing category from bottom
      if (value) {
        if (expandController.isCompleted) {
          expandController.reset();
        }
        expandController.forward();
      }
    });
  }
}
