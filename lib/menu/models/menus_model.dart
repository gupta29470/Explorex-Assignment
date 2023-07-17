import 'package:explorex_assignment/common/constants/app_constants.dart';
import 'package:explorex_assignment/common/functions/common_functions.dart';

class MenuItemSubModel {
/*
{
  "itemCode": "WHEATBEER",
  "name": "alcohol",
  "description": "",
  "meatStatus": "VEG",
  "image": "https://dcdn.explorex.co/media/bhaski-s/menu/food-mwnu/62443ecb034e385d39b10c04/alcohol_1649419005248_min.jpeg",
  "hasImage": true
} 
*/

  String? itemCode;
  String? name;
  String? description;
  String? meatStatus;
  String? image;
  bool? hasImage;

  MenuItemSubModel({
    this.itemCode,
    this.name,
    this.description,
    this.meatStatus,
    this.image,
    this.hasImage,
  });
  MenuItemSubModel.fromJson(Map<String, dynamic> json) {
    itemCode = json['itemCode']?.toString();
    name = json['name']?.toString();
    description = json['description']?.toString();
    meatStatus = json['meatStatus']?.toString();
    image = json['image']?.toString();
    hasImage = json['hasImage'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['itemCode'] = itemCode;
    data['name'] = name;
    data['description'] = description;
    data['meatStatus'] = meatStatus;
    data['image'] = image;
    data['hasImage'] = hasImage;
    return data;
  }
}

class MenuItemModel {
/*
{
	"id": "641ec8d4f65a8012a51973a8",
	"dish": {
		"itemCode": "WHEATBEER",
		"name": "alcohol",
		"description": "",
		"meatStatus": "VEG",
		"image": "https://dcdn.explorex.co/media/bhaski-s/menu/food-mwnu/62443ecb034e385d39b10c04/alcohol_1649419005248_min.jpeg"
	},
	"category": "Top Category",
	"sellingPrice": 180,
	"displayPrice": 230,
	"isRecommended": true
}
*/

  String? id;
  MenuItemSubModel? dish;
  String? category;
  num? sellingPrice;
  num? displayPrice;
  bool? isRecommended;

  MenuItemModel({
    this.id,
    this.dish,
    this.category,
    this.sellingPrice,
    this.displayPrice,
    this.isRecommended,
  });
  MenuItemModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id']?.toString();
    dish =
        (json['dish'] != null) ? MenuItemSubModel.fromJson(json['dish']) : null;
    category = json['category']?.toString();
    sellingPrice = json['sellingPrice'];
    displayPrice = json['displayPrice'];
    isRecommended = json['isRecommended'];
  }
  Map<dynamic, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (dish != null) {
      data['dish'] = dish!.toJson();
    }
    data['category'] = category;
    data['sellingPrice'] = sellingPrice;
    data['displayPrice'] = displayPrice;
    data['isRecommended'] = isRecommended;
    return data;
  }
}

class MenuTypeModel {
/*
{
	"id": "5c81109b51795c1ddfa74f5e",
	"name": "Food Menu",
	"entries": [{
		"id": "641ec8d4f65a8012a51973a8",
		"dish": {
			"itemCode": "WHEATBEER",
			"name": "alcohol",
			"description": "",
			"meatStatus": "VEG",
			"image": "https://dcdn.explorex.co/media/bhaski-s/menu/food-mwnu/62443ecb034e385d39b10c04/alcohol_1649419005248_min.jpeg"
		},
		"category": "Top Category",
		"sellingPrice": 180,
		"displayPrice": 230,
		"isRecommended": true
	}]
}
*/

  String? id;
  String? name;
  List<MenuItemModel?>? entries;

  MenuTypeModel({
    this.id,
    this.name,
    this.entries,
  });
  MenuTypeModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    if (json['entries'] != null) {
      final v = json['entries'];
      final arr0 = <MenuItemModel>[];
      v.forEach((v) {
        arr0.add(MenuItemModel.fromJson(v));
      });
      entries = arr0;
    }
  }
  Map<dynamic, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (entries != null) {
      final v = entries;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['entries'] = arr0;
    }
    return data;
  }
}

class MenusModelDescriptionModel {
/*
{
	"menus": [{
		"id": "5c81109b51795c1ddfa74f5e",
		"name": "Food Menu",
		"entries": [{
			"id": "641ec8d4f65a8012a51973a8",
			"dish": {
				"itemCode": "WHEATBEER",
				"name": "alcohol",
				"description": "",
				"meatStatus": "VEG",
				"image": "https://dcdn.explorex.co/media/bhaski-s/menu/food-mwnu/62443ecb034e385d39b10c04/alcohol_1649419005248_min.jpeg"
			},
			"category": "Top Category",
			"sellingPrice": 180,
			"displayPrice": 230,
			"isRecommended": true
		}]
	}]
}
*/

  List<MenuTypeModel?>? menus;
  Map<String, Map<String, Map<String, List<MenuItemModel?>>>>? meatTypeData =
      {};

  Map<String, Map<String, List<MenuItemModel?>>>? categoriesData = {};

  MenusModelDescriptionModel({
    this.menus,
    this.meatTypeData,
    this.categoriesData,
  });
  MenusModelDescriptionModel.fromJson(Map<dynamic, dynamic> json) {
    if (json['menus'] != null) {
      final v = json['menus'];
      final arr0 = <MenuTypeModel>[];
      v.forEach((v) {
        arr0.add(MenuTypeModel.fromJson(v));
      });
      menus = arr0;
    }

    for (int index1 = 0; index1 < (menus?.length ?? 0); index1++) {
      for (int index2 = 0;
          index2 < (menus?[index1]?.entries?.length ?? 0);
          index2++) {
        MenuItemModel? menuItemModel = menus?[index1]?.entries?[index2];
        String? menuName = menus?[index1]?.name;

        if (menuName != null &&
            menuName.isNotEmpty == true &&
            menuItemModel != null &&
            menuItemModel.dish != null &&
            menuItemModel.category != null &&
            menuItemModel.category?.isNotEmpty == true) {
          String? meatStatusKey =
              getMealStatusKey(menuItemModel.dish?.meatStatus);
          String category = menuItemModel.isRecommended == true
              ? CategoryConstants.recommended
              : menuItemModel.category ?? "";
          if (meatStatusKey.isNotEmpty) {
            if (meatTypeData?.containsKey(menuName) == true) {
              if (meatTypeData?[menuName]?.containsKey(meatStatusKey) == true) {
                if (meatTypeData?[menuName]?[meatStatusKey]
                        ?.containsKey(category) ==
                    true) {
                  meatTypeData?[menuName]?[meatStatusKey]?[category]
                      ?.add(menuItemModel);
                } else {
                  meatTypeData?[menuName]?[meatStatusKey]
                      ?[category] = [menuItemModel];
                }
              } else {
                meatTypeData?[menuName]?[meatStatusKey] = {
                  category: [menuItemModel]
                };
              }
            } else {
              meatTypeData?[menuName] = {
                meatStatusKey: {
                  category: [menuItemModel],
                },
              };
            }

            if (categoriesData?.containsKey(menuName) == true) {
              if (categoriesData?[menuName]?.containsKey(category) == true) {
                categoriesData?[menuName]?[category]?.add(menuItemModel);
              } else {
                categoriesData?[menuName]?[category] = [menuItemModel];
              }
            } else {
              categoriesData?[menuName] = {
                category: [menuItemModel],
              };
            }
          }
        }
      }
    }
  }
  Map<dynamic, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (menus != null) {
      final v = menus;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['menus'] = arr0;
    }
    return data;
  }
}

class MenusModel {
/*
{
	"code": 0,
	"description": {
		"menus": [{
			"id": "5c81109b51795c1ddfa74f5e",
			"name": "Food Menu",
			"entries": [{
				"id": "641ec8d4f65a8012a51973a8",
				"dish": {
					"itemCode": "WHEATBEER",
					"name": "alcohol",
					"description": "",
					"meatStatus": "VEG",
					"image": "https://dcdn.explorex.co/media/bhaski-s/menu/food-mwnu/62443ecb034e385d39b10c04/alcohol_1649419005248_min.jpeg"
				},
				"category": "Top Category",
				"sellingPrice": 180,
				"displayPrice": 230,
				"isRecommended": true
			}]
		}]
	}
}
*/

  int? code;
  MenusModelDescriptionModel? description;

  MenusModel({
    this.code,
    this.description,
  });
  MenusModel.fromJson(Map<dynamic, dynamic> json) {
    code = json['code']?.toInt();
    description = (json['description'] != null)
        ? MenusModelDescriptionModel.fromJson(json['description'])
        : null;
  }
  Map<dynamic, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    return data;
  }

  MenusModel.isEmpty();
}
