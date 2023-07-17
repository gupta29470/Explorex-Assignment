import 'package:explorex_assignment/menu/provider/cart_provider.dart';
import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:explorex_assignment/styles/button_theme/button_theme_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewOrderWidget extends StatefulWidget {
  const ViewOrderWidget({super.key});

  @override
  State<ViewOrderWidget> createState() => _ViewOrderWidgetState();
}

class _ViewOrderWidgetState extends State<ViewOrderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController viewOrderController;
  late Animation<double> viewOrderAnimation;

  @override
  void initState() {
    super.initState();

    viewOrderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );

    viewOrderAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: viewOrderController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        if (ref.watch(cartProvider).isNotEmpty) {
          viewOrderController.forward();
        } else {
          viewOrderController.reverse();
        }

        (int, num) result = ref.read(cartProvider.notifier).cartLengthAndPrice;

        return SizeTransition(
          sizeFactor: viewOrderAnimation,
          child: FadeTransition(
            opacity: viewOrderAnimation,
            child: Container(
              margin: const EdgeInsets.fromLTRB(
                8,
                0,
                8,
                24,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: AppColorHelper.yueGuangLanBlue,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 4,
                        ),
                        child: Text(
                          "Rs ${result.$2}",
                          style: TextThemeHelper.white_16_600,
                        ),
                      ),
                      Text(
                        "${result.$1} items",
                        style: TextThemeHelper.white_9_400,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonThemeHelper.viewOrderButtonStyle,
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                          ),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: AppColorHelper.hooloovooBlue,
                            size: 16,
                          ),
                        ),
                        Text(
                          "View & Order",
                          style: TextThemeHelper.hooloovooBlue_12_600,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
