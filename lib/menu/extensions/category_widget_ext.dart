part of '../widgets/category_widget.dart';

extension on CategoryWidget {
  void consumerRebuild({
    required int selectedCategoryValue,
    required bool value,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
