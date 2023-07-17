import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:explorex_assignment/common/enum/enums.dart';
import 'package:explorex_assignment/menu/repository/menu_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:explorex_assignment/menu/models/menus_model.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  static const String tag = "MenuCubit";

  final MenuRepository _menuRepository;

  MenuCubit(this._menuRepository)
      : super(
          MenuState(),
        );

  Future<void> getMenus() async {
    emit(
      state.copyWith(menuCubitStatus: MenuCubitStatus.loading),
    );

    try {
      MenusModel? menusModel = await _menuRepository.getMenus();

      if (menusModel != null &&
          menusModel.description != null &&
          menusModel.description?.menus != null &&
          menusModel.description?.menus?.isNotEmpty == true &&
          menusModel.description?.meatTypeData != null &&
          menusModel.description?.meatTypeData?.isNotEmpty == true &&
          menusModel.description?.categoriesData != null &&
          menusModel.description?.categoriesData?.isNotEmpty == true &&
          menusModel.code == 0) {
        emit(
          state.copyWith(
            menuCubitStatus: MenuCubitStatus.success,
            menusModel: menusModel,
          ),
        );
      } else {
        emit(
          state.copyWith(
            menuCubitStatus: MenuCubitStatus.error,
          ),
        );
      }
    } catch (error) {
      log("$tag ====================== $error");
      emit(
        state.copyWith(
          menuCubitStatus: MenuCubitStatus.error,
        ),
      );
    }
  }
}
