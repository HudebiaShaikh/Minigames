import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:minigames/models/game_category.dart';

part 'category_provider.g.dart';

class SortSettingsModel {
  final List<GameCategory> categoryOrder;
  
  const SortSettingsModel({
    required this.categoryOrder,
  });
  
  SortSettingsModel copyWith({
    List<GameCategory>? categoryOrder,
  }) {
    return SortSettingsModel(
      categoryOrder: categoryOrder ?? this.categoryOrder,
    );
  }
}

@Riverpod(keepAlive: true)
class SortSettings extends _$SortSettings {
  @override
  SortSettingsModel build() {
    return SortSettingsModel(
      categoryOrder: GameCategory.values.toList(),
    );
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final categoryOrderList = prefs.getStringList('category_order');
    
    List<GameCategory> order;
    if (categoryOrderList != null) {
      order = categoryOrderList
          .map((name) => GameCategoryExtension.fromName(name))
          .whereType<GameCategory>()
          .toList();
      // Ensure all categories present (handle migration)
      if (order.length != GameCategory.values.length) {
        order = GameCategory.values.toList();
      }
    } else {
      order = GameCategory.values.toList();
    }
    
    state = SortSettingsModel(categoryOrder: order);
  }
}
