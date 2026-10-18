import 'package:flutter/material.dart';

import 'movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.isGrid,
    required this.discountPercent,
    required this.onDiscountTap,
  });

  final Movie movie;
  final bool isGrid;
  final int discountPercent;
  final VoidCallback onDiscountTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final details = Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            movie.genre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A20252B),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: isGrid
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _buildPoster(context)),
                details,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 118, child: _buildPoster(context)),
                Expanded(child: details),
              ],
            ),
    );
  }

  Widget _buildPoster(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 0.72,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(movie.image, fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x26000000), Color(0x00000000), Color(0x99000000)],
                stops: [0, 0.45, 1],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: _posterLabel(
              context,
              movie.rating.toStringAsFixed(1),
              colorScheme.primary,
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: Icon(
              Icons.bookmark_outline,
              color: Colors.white,
              size: 24,
              shadows: const [Shadow(color: Colors.black54, blurRadius: 4)],
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text(
              '${movie.year}',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    shadows: const [Shadow(color: Colors.black87, blurRadius: 4)],
                  ),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Material(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                onTap: onDiscountTap,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 5,
                  ),
                  child: Text(
                    '$discountPercent% OFF',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _posterLabel(BuildContext context, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}