import 'package:explorex_assignment/menu/models/menus_model.dart';

class CartMenuItemModel {
  int? count;
  MenuItemModel? menuItemModel;

  CartMenuItemModel({
    this.count,
    this.menuItemModel,
  });

  static CartMenuItemModel copyWith({
    int? count,
    MenuItemModel? menuItemModel,
  }) {
    return CartMenuItemModel(
      count: count,
      menuItemModel: menuItemModel,
    );
  }
}
