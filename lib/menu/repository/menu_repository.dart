import 'dart:convert';
import 'dart:developer';

import 'package:explorex_assignment/menu/models/menus_model.dart';
import 'package:explorex_assignment/resources/jsons.dart';
import 'package:flutter/services.dart';

class MenuRepository {
  static const String tag = "MenuRepository";

  Future<MenusModel?> getMenus() async {
    try {
      String stringJson = await rootBundle.loadString(Jsons.menuData);
      final data = json.decode(stringJson);
      MenusModel menusModel = MenusModel.fromJson(data);
      log("$tag ===================== ${menusModel.code}");
      return menusModel;
    } catch (error) {
      log("$tag ===================== $error");
    }

    return null;
  }
}
