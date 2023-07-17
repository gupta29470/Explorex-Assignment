import 'package:explorex_assignment/menu/repository/menu_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryInjection extends StatelessWidget {
  final Widget child;

  const RepositoryInjection({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => MenuRepository(),
        ),
      ],
      child: child,
    );
  }
}
