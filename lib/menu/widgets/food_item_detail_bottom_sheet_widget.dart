import 'package:cached_network_image/cached_network_image.dart';
import 'package:explorex_assignment/common/functions/common_functions.dart';
import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/menu/provider/cart_provider.dart';
import 'package:explorex_assignment/menu/widgets/cart_button_widget.dart';
import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodItemDetailBottomWidget extends StatelessWidget {
  final MenuItemModel menuItemModel;

  const FoodItemDetailBottomWidget({
    super.key,
    required this.menuItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: const EdgeInsets.all(16),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.cancel_outlined,
            color: AppColorHelper.white,
            size: 24,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          decoration: DecorationHelper.bsWhiteDecor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (menuItemModel.dish?.hasImage == true) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CachedNetworkImage(
                    imageUrl: menuItemModel.dish?.image ?? "",
                    imageBuilder: (_, imageProvider) {
                      return SizedBox(
                        height: 180,
                        child: DecoratedBox(
                          decoration: DecorationHelper.foodItemBSImageDecor(
                            menuItemModel.dish?.image ?? "",
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  bottom: 16,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset(
                        getMeatTypeImage(
                          menuItemModel.dish?.meatStatus ?? "",
                        ),
                        height: 16,
                        width: 16,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "${menuItemModel.dish?.name}",
                      style: TextThemeHelper.darkToneInk_16_600,
                    )
                  ],
                ),
              ),
              if (menuItemModel.dish?.description != null &&
                  menuItemModel.dish?.description?.isNotEmpty == true) ...[
                Flexible(
                  child: Text(
                    "${menuItemModel.dish?.description}",
                    style: TextThemeHelper.chromeAluminium_12_400,
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CartButtonWidget(
                        currentMenuItem: menuItemModel,
                        height: 42,
                        width: 126,
                      ),
                    ),
                    Expanded(
                      child: DecoratedBox(
                        decoration: DecorationHelper.foodItemBSAddCardDecor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 13,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add to Cart",
                                style: TextThemeHelper.white_12_600,
                              ),
                              Consumer(
                                builder: (_, ref, __) {
                                  ref.watch(cartProvider);
                                  (int, num) result = ref
                                      .read(cartProvider.notifier)
                                      .cartLengthAndPrice;

                                  return Text(
                                    result.$1 <= 0
                                        ? "₹${menuItemModel.sellingPrice}"
                                        : "₹${result.$2}",
                                    style: TextThemeHelper.white_12_600,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
