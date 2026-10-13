import 'package:flutter/material.dart';

/// Game type enumeration for all games in the collection.
/// Currently supports 2 games in a responsive grid layout.
enum GameType {
  schulteGrid,
  fishing,
}

extension GameTypeExtension on GameType {
  /// Display name for the game
  String get displayName {
    switch (this) {
      case GameType.schulteGrid:
        return 'Schulte Grid';
      case GameType.fishing:
        return 'Fishing';
    }
  }

  /// Route name for the game screen
  String get route {
    switch (this) {
      case GameType.schulteGrid:
        return '/schulte-grid';
      case GameType.fishing:
        return '/fishing';
    }
  }

  /// Icon representing the game (used on game cards)
  IconData get iconData {
    switch (this) {
      case GameType.schulteGrid:
        return Icons.grid_4x4;
      case GameType.fishing:
        return Icons.phishing;
    }
  }

  DateTime get releaseDate {
    switch (this) {
      case GameType.schulteGrid:
        return DateTime(2026, 5, 1);
      case GameType.fishing:
        return DateTime(2026, 5, 3);
    }
  }

  bool get isWip => false;
}
