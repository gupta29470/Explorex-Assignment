import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = StateProvider<(int, bool)>(
  (ref) => (-1, false),
);
