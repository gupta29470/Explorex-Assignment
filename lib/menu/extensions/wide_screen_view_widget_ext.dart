part of '../widgets/wide_screen_view_widget.dart';

extension on WideScreenViewWidget {
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

  int gridAxisCount(double currentWidth) {
    return currentWidth >= 1300
        ? 3
        : currentWidth < 1300 && currentWidth >= 800
            ? 2
            : 1;
  }

  double gridChildAS(double currentWidth) {
    return currentWidth >= 1500
        ? (1 / .8)
        : currentWidth >= 1200
            ? (1 / .8)
            : currentWidth >= 800
                ? (1)
                : (1 / .4);
  }
}
