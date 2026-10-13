import 'package:flutter/material.dart';
import '../../models/game_type.dart';
import '../theme/theme_colors.dart';

/// A card widget displaying a game with wooden styling.
///
/// Shows the game title, and description.
class GameCard extends StatelessWidget {
  /// The game type to display.
  final GameType gameType;

  /// The localized title of the game.
  final String title;

  /// The localized description of the game.
  final String description;

  /// Callback when the card is tapped.
  final VoidCallback? onTap;

  /// Creates a game card widget.
  const GameCard({
    super.key,
    required this.gameType,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = context.themeCard;
    final borderColor = context.themeBorder;
    final textColor = context.themeTextPrimary;
    final secondaryTextColor = context.themeTextSecondary;
    final accentColor = context.themeAccent;

    return Card(
      elevation: 4.0,
      shadowColor: context.themeShadow,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Main content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Game icon in accent-bordered box
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.2),
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      gameType.iconData,
                      color: accentColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  // Game Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      letterSpacing: 0.3,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6.0),
                  // Game Description
                  Flexible(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 11,
                        color: secondaryTextColor,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
