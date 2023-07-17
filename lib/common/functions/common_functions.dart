import 'package:explorex_assignment/common/constants/app_constants.dart';
import 'package:explorex_assignment/resources/resource.dart';

String getMealStatusKey(String? value) {
  if (value != null && value.isNotEmpty) {
    if (MeatTypeConstants.potentialVegTypes.contains(value)) {
      return MeatTypeConstants.veg;
    } else if (MeatTypeConstants.potentialNonVegTypes.contains(value)) {
      return MeatTypeConstants.nonVeg;
    } else if (MeatTypeConstants.potentialVeganTypes.contains(value)) {
      return MeatTypeConstants.vegan;
    } else if (MeatTypeConstants.potentialEggTypes.contains(value)) {
      return MeatTypeConstants.egg;
    }
  }
  return "";
}

String getMeatTypeImage(String meatType) {
  if (!MeatTypeConstants.potentialNATypes.contains(meatType)) {
    if (MeatTypeConstants.potentialVegTypes.contains(meatType)) {
      return Images.vegIcon;
    } else if (MeatTypeConstants.potentialNonVegTypes.contains(meatType)) {
      return Images.nonVegIcon;
    } else if (MeatTypeConstants.potentialVeganTypes.contains(meatType)) {
      return Images.veganIcon;
    } else if (MeatTypeConstants.potentialEggTypes.contains(meatType)) {
      return Images.eggIcon;
    }
  }
  return "";
}
