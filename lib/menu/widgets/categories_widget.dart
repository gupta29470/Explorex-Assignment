import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/provider/category_scroll_controller_provider.dart';
import 'package:explorex_assignment/menu/widgets/category_widget.dart';
import 'package:explorex_assignment/menu/widgets/wide_screen_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
              return Consumer(builder: (_, ref, __) {
                ItemScrollController scrollController =
                    ref.watch(categorySCProvider);

                return ScrollablePositionedList.builder(
                  itemScrollController: scrollController,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
                  itemCount: widget.categories.length,
                  itemBuilder: (_, index) {
                    return CategoryWidget(
                      categoryTitle: widget.categories.keys.elementAt(index),
                      categoryMenuList:
                          widget.categories.values.elementAt(index),
                      index: index,
                      expandController: expandController,
                      expandAnimation: expandAnimation,
                    );
                  },
                );
              });
            },
          );
        },
      ),
    );
  }
}
