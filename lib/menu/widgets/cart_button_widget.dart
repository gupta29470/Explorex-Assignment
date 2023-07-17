import 'package:explorex_assignment/menu/models/cart_menu_item_model.dart';
import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/provider/cart_provider.dart';
import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:explorex_assignment/styles/button_theme/button_theme_helper.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../extensions/cart_button_widget_ext.dart';

class CartButtonWidget extends ConsumerWidget {
  final double height;
  final MenuItemModel currentMenuItem;
  final double width;

  const CartButtonWidget({
    super.key,
    required this.currentMenuItem,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, CartMenuItemModel> currentCart = ref.watch(cartProvider);

    return SizedBox(
      height: height,
      width: width,
      child: ref.read(cartProvider.notifier).isCartEmpty ||
              !ref.read(cartProvider.notifier).isFoodAdded(currentMenuItem.id!)
          ? ElevatedButton(
              onPressed: () {
                addItem(ref);
              },
              style: ButtonThemeHelper.addMenuItemButtonStyle,
              child: Center(
                child: Text(
                  "Add",
                  style: TextThemeHelper.hooloovooBlue_12_400,
                ),
              ),
            )
          : DecoratedBox(
              decoration: DecorationHelper.cartIncrementDecrementDecor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style:
                          ButtonThemeHelper.incrementDecrementMenuButtonStyle,
                      onPressed: () {
                        removeItem(ref);
                      },
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          color: AppColorHelper.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "${currentCart[currentMenuItem.id]?.count}",
                        style: TextThemeHelper.hooloovooBlue_12_600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style:
                          ButtonThemeHelper.incrementDecrementMenuButtonStyle,
                      onPressed: () {
                        addItem(ref);
                      },
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColorHelper.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
