import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final categorySCProvider = StateProvider<ItemScrollController>(
  (ref) => ItemScrollController(),
);
