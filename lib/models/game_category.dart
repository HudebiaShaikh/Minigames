import 'package:flutter/material.dart';
import 'package:minigames/models/game_type.dart';
import 'package:minigames/l10n/generated/app_localizations.dart';

/// Game category enumeration for grouping games by type.
enum GameCategory { reaction, casual }

extension GameCategoryExtension on GameCategory {
  /// Display name for the category (localized)
  String displayName(AppLocalizations l10n) {
    switch (this) {
      case GameCategory.reaction:
        return l10n.category_reaction;
      case GameCategory.casual:
        return l10n.category_casual;
    }
  }

  /// Icon representing the category
  IconData get icon {
    switch (this) {
      case GameCategory.reaction:
        return Icons.touch_app;
      case GameCategory.casual:
        return Icons.sports_esports;
    }
  }

  /// Games in this category
  List<GameType> get gameTypes {
    switch (this) {
      case GameCategory.reaction:
        return [GameType.schulteGrid];
      case GameCategory.casual:
        return [GameType.fishing];
    }
  }

  /// Get category by name (for SharedPreferences deserialization)
  static GameCategory? fromName(String name) {
    switch (name) {
      case 'reaction':
        return GameCategory.reaction;
      case 'casual':
        return GameCategory.casual;
      default:
        return null;
    }
  }
}

/// Extension to get category from GameType
extension GameTypeCategoryExtension on GameType {
  /// The category this game belongs to
  GameCategory? get category {
    switch (this) {
      case GameType.schulteGrid:
        return GameCategory.reaction;
      case GameType.fishing:
        return GameCategory.casual;
    }
  }
}
