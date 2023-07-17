import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/widgets/category_widget.dart';
import 'package:explorex_assignment/menu/widgets/wide_screen_view_widget.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  final Map<String, List<MenuItemModel?>> categories;

  const CategoriesWidget({
    super.key,
    required this.categories,
  });

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> expandAnimation;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      reverseDuration: const Duration(
        milliseconds: 300,
      ),
    );

    expandAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: expandController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return OrientationBuilder(
            builder: (_, orientation) {
              bool isWideScreen = constraints.maxWidth >= 600;

              if (isWideScreen) {
                return WideScreenViewWidget(
                  categories: widget.categories,
                  expandAnimation: expandAnimation,
                  expandController: expandController,
                );
              }
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: widget.categories.length,
                itemBuilder: (_, index) {
                  return CategoryWidget(
                    categoryTitle: widget.categories.keys.elementAt(index),
                    categoryMenuList: widget.categories.values.elementAt(index),
                    index: index,
                    expandController: expandController,
                    expandAnimation: expandAnimation,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

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