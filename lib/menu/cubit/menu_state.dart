part of 'menu_cubit.dart';

class MenuState extends Equatable {
  final MenuCubitStatus menuCubitStatus;
  final MenusModel menusModel;

  MenuState({
    this.menuCubitStatus = MenuCubitStatus.initial,
    MenusModel? menusModel,
  }) : menusModel = menusModel ?? MenusModel.isEmpty();

  MenuState copyWith({
    MenuCubitStatus? menuCubitStatus,
    MenusModel? menusModel,
  }) {
    return MenuState(
      menuCubitStatus: menuCubitStatus ?? this.menuCubitStatus,
      menusModel: menusModel ?? this.menusModel,
    );
  }

  @override
  List<Object?> get props => [
        menuCubitStatus,
        menusModel,
      ];
}
