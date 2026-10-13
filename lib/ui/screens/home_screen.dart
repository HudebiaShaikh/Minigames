import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../models/game_type.dart';
import '../../models/game_category.dart';
import '../../providers/category_provider.dart';
import '../theme/theme_colors.dart';
import '../widgets/game_card.dart';
import '../widgets/wooden_app_bar.dart';
import '../../games/schulte_grid/screens/schulte_grid_start_screen.dart';
import '../../games/fishing/screens/fishing_start_screen.dart';

/// The home screen displaying a scrollable grid of game cards.
///
/// Games are grouped by category sections.
class HomeScreen extends ConsumerStatefulWidget {
  /// Creates the home screen.
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  /// Navigate to the game screen based on game type
  void _navigateToGame(BuildContext context, GameType gameType) {
    switch (gameType) {
      case GameType.schulteGrid:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SchulteGridStartScreen()),
        );
        break;
      case GameType.fishing:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FishingStartScreen()),
        );
        break;
    }
  }

  /// Get the localized title for a game
  String _getGameTitle(AppLocalizations l10n, GameType gameType) {
    switch (gameType) {
      case GameType.schulteGrid:
        return l10n.sg_gameTitle;
      case GameType.fishing:
        return l10n.game_fishing;
    }
  }

  /// Get the localized description for a game
  String _getGameDescription(AppLocalizations l10n, GameType gameType) {
    switch (gameType) {
      case GameType.schulteGrid:
        return l10n.sg_gameDescription;
      case GameType.fishing:
        return l10n.fishing_gameDescription;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final backgroundColor = context.themeBackground;

    final sortSettings = ref.watch(sortSettingsProvider);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: WoodenAppBar(
        titleText: l10n.appTitle,
      ),
      body: _buildCategoryModeBody(l10n, sortSettings),
    );
  }

  /// Build body for category mode: grouped sections
  Widget _buildCategoryModeBody(
    AppLocalizations l10n,
    SortSettingsModel settings,
  ) {
    final orderedCategories = settings.categoryOrder;

    return ListView(
      children: [
        for (final category in orderedCategories)
          Container(
            key: ValueKey(category.name),
            child: Column(
              children: [
                _buildCategoryHeader(category, l10n),
                _buildGameGrid(context, category.gameTypes, l10n, nested: true),
              ],
            ),
          ),
      ],
    );
  }

  /// Build category section header
  Widget _buildCategoryHeader(
    GameCategory category,
    AppLocalizations l10n,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(category.icon, size: 20, color: context.themeAccent),
          const SizedBox(width: 8),
          Text(
            category.displayName(l10n),
            style: TextStyle(
              color: context.themeTextPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            l10n.favorites_count(category.gameTypes.length),
            style: TextStyle(
              color: context.themeTextSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  /// Build the scrollable grid of game cards with responsive layout.
  ///
  /// When [nested] is true (inside ListView),
  /// uses shrinkWrap and NeverScrollableScrollPhysics to avoid scroll conflicts.
  Widget _buildGameGrid(
    BuildContext context,
    List<GameType> games,
    AppLocalizations l10n, {
    required bool nested,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        // Define card size constraints
        const double minCardWidth = 140.0;
        const double maxCardWidth = 200.0;
        const double minCardHeight = 160.0;
        const double maxCardHeight = 200.0;
        const double spacing = 16.0;
        const double horizontalPadding = 16.0;

        // Calculate number of columns based on available width
        final availableWidth = screenWidth - (horizontalPadding * 2);

        int crossAxisCount = 1;
        double cardWidth = minCardWidth;

        // Calculate how many cards can fit (try from 4 down to 1)
        for (int cols = 4; cols >= 1; cols--) {
          final possibleCardWidth =
              (availableWidth - (spacing * (cols - 1))) / cols;
          if (possibleCardWidth >= minCardWidth) {
            crossAxisCount = cols;
            cardWidth = possibleCardWidth.clamp(minCardWidth, maxCardWidth);
            break;
          }
        }

        // Calculate card height with aspect ratio
        final cardHeight = (cardWidth * 1.15).clamp(
          minCardHeight,
          maxCardHeight,
        );

        return GridView.builder(
          shrinkWrap: nested,
          physics: nested ? const NeverScrollableScrollPhysics() : null,
          padding: const EdgeInsets.all(horizontalPadding),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: cardHeight,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
          ),
          itemCount: games.length,
          itemBuilder: (context, index) {
            final game = games[index];

            return GameCard(
              gameType: game,
              title: _getGameTitle(l10n, game),
              description: _getGameDescription(l10n, game),
              onTap: () => _navigateToGame(context, game),
            );
          },
        );
      },
    );
  }
}
