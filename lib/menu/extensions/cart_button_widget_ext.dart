part of '../widgets/cart_button_widget.dart';

extension on CartButtonWidget {
  void addItem(WidgetRef ref) {
    ref.read(cartProvider.notifier).addItem(
          currentMenuItem,
        );
  }

  void removeItem(WidgetRef ref) {
    ref.read(cartProvider.notifier).removeItem(
          currentMenuItem,
        );
  }
}
