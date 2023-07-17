import 'package:explorex_assignment/menu/cubit/menu_cubit.dart';
import 'package:explorex_assignment/menu/repository/menu_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocInjection extends StatelessWidget {
  final Widget child;

  const BlocInjection({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuCubit(
            RepositoryProvider.of<MenuRepository>(
              context,
              listen: false,
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
