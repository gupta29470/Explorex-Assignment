import 'package:explorex_assignment/menu/models/cart_menu_item_model.dart';
import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, Map<String, CartMenuItemModel>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<Map<String, CartMenuItemModel>> {
  CartNotifier() : super({});

  void addItem(MenuItemModel menuItemModel) {
    String id = menuItemModel.id ?? "";
    if (state.containsKey(id)) {
      CartMenuItemModel cartMenuItemModel = CartMenuItemModel.copyWith(
        count: (state[id]?.count ?? 0) + 1,
        menuItemModel: state[id]?.menuItemModel,
      );

      state[id] = cartMenuItemModel;
      state = {...state};
    } else {
      CartMenuItemModel cartMenuItemModel = CartMenuItemModel.copyWith(
        count: 1,
        menuItemModel: menuItemModel,
      );
      state = {
        ...state,
        id: cartMenuItemModel,
      };
    }
  }

  void removeItem(MenuItemModel menuItemModel) {
    String id = menuItemModel.id ?? "";

    if (state.containsKey(id)) {
      int currentValue = state[id]?.count ?? 0;

      if (currentValue <= 1) {
        state.remove(id);
      } else {
        CartMenuItemModel cartMenuItemModel = CartMenuItemModel.copyWith(
          count: (state[id]?.count ?? 0) - 1,
          menuItemModel: state[id]?.menuItemModel,
        );
        state[id] = cartMenuItemModel;
      }

      state = {...state};
    }
  }

  bool get isCartEmpty => state.isEmpty;

  int currentItemLength(String id) => state[id]?.count ?? 0;

  bool isFoodAdded(String id) => state.containsKey(id);

  (int, num) get cartLengthAndPrice {
    int length = 0;
    num price = 0;

    state.forEach((key, value) {
      length += value.count ?? 0;
      price += (value.menuItemModel?.sellingPrice ?? 1) * length;
    });

    return (length, price);
  }
}
