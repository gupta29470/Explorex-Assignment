import 'package:explorex_assignment/dependency_injection/bloc_injection.dart';
import 'package:explorex_assignment/dependency_injection/repository_injection.dart';
import 'package:explorex_assignment/menu/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ExplorexApp());
}

class ExplorexApp extends StatelessWidget {
  const ExplorexApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const RepositoryInjection(
      child: BlocInjection(
        child: ProviderScope(
          child: MaterialApp(
            title: 'Explorex App',
            home: MenuScreen(),
          ),
        ),
      ),
    );
  }
}
