import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/provider/category_provider.dart';
import 'package:explorex_assignment/resources/resource.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../extensions/menu_type_grid_widget_ext.dart';

class MenuTypeGridWidget extends StatelessWidget {
  final List<MenuTypeModel?>? menus;
  final String currentMenuValue;
  final ValueNotifier<String> currentMenuNotifier;

  const MenuTypeGridWidget({
    super.key,
    required this.menus,
    required this.currentMenuValue,
    required this.currentMenuNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 160,
      ),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / .4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 8,
        ),
        itemCount: menus?.length,
        itemBuilder: (_, index) {
          String? menuName = menus?[index]?.name;
          return InkWell(
            onTap: () {
              menuTap(
                menuName,
                context,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 13,
              ),
              decoration: DecorationHelper.bsFoodMenuDecor(
                selected: currentMenuValue == menuName,
                image: Images.menuBG,
              ),
              child: Text(
                "$menuName",
                style: currentMenuValue == menuName
                    ? TextThemeHelper.white_12_800
                    : TextThemeHelper.white_12_400,
              ),
            ),
          );
        },
      ),
    );
  }
}
