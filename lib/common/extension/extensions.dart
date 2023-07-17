import 'package:explorex_assignment/common/enum/enums.dart';
import 'package:explorex_assignment/menu/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BuildContextX on BuildContext {
  MenuCubit get menuCubit => read<MenuCubit>();
}

extension MenuCubitStatusX on MenuCubitStatus {
  bool get isInitial => this == MenuCubitStatus.initial;

  bool get isLoading => this == MenuCubitStatus.loading;

  bool get isSuccess => this == MenuCubitStatus.success;

  bool get isFailure => this == MenuCubitStatus.error;
}
