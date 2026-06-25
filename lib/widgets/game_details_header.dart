import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../services/app_settings.dart';
import '../screens/write_review_screen.dart';

class GameDetailsHeader extends StatelessWidget {
  final dynamic game;

  final String imageUrl;

  final VoidCallback? onReviewSubmitted;

  const GameDetailsHeader({

    super.key,

    required this.game,

    required this.imageUrl,

    this.onReviewSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final settings = AppSettings();

    return SizedBox(

      height: 520,

      child: Stack(

        children: [

          CachedNetworkImage(

            imageUrl: imageUrl,

            width: double.infinity,

            height: 520,

            fit: BoxFit.cover,
          ),

          Container(

            decoration: BoxDecoration(

              gradient: LinearGradient(

                begin: Alignment.bottomCenter,

                end: Alignment.topCenter,

                colors: [

                  Colors.black.withOpacity(0.95),

                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),

          SafeArea(

            child: Padding(

              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text(
                    'PLAYBOXED',
                    style: TextStyle(
                      color: settings.accentColor,

                      fontSize: 28,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(

                    onPressed: () {
                      Navigator.pop(context);
                    },

                    icon: Icon(
                      Icons.close,
                      color: settings.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(

            left: 20,

            right: 20,

            bottom: 40,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Row(

                  children: [

                    buildTag('ACTION RPG'),

                    const SizedBox(width: 8),

                    buildTag('OPEN WORLD'),
                  ],
                ),

                const SizedBox(height: 16),

                Text(
                  game['name'] ?? '',
                  style: TextStyle(
                    color: settings.textColor,

                    fontSize: 42,

                    height: 1,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                Row(

                  children: [

                    Icon(Icons.star, color: settings.accentColor),

                    const SizedBox(width: 6),

                    Text(

                      '${(game['rating'] ?? 0).toStringAsFixed(1)} (12.4k Reviews)',

                      style: TextStyle(
                        color: settings.textColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                Row(

                  children: [

                    Expanded(

                      child: Container(

                        height: 56,

                        decoration: BoxDecoration(
                          color: settings.accentColor,
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline, color: settings.accentTextColor),

                            SizedBox(width: 8),

                            Flexible(
                              child: Text(

                                'ADD TO LIBRARY',
                                style: TextStyle(
                                  color: settings.accentTextColor,

                                  fontWeight: FontWeight.bold,
                                ),

                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    GestureDetector(

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WriteReviewScreen(
                              game: game,
                              imageUrl: imageUrl,
                            ),
                          ),
                        ).then((submitted) {
                          if (submitted == true) {
                            onReviewSubmitted?.call();
                          }
                        });
                      },

                      child: Container(

                        height: 56,

                        padding: const EdgeInsets.symmetric(horizontal: 18),

                        decoration: BoxDecoration(
                          color: settings.cardColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: settings.borderColor),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit_outlined, color: settings.textColor),

                            SizedBox(width: 8),

                            Text(
                              'REVIEW',
                              style: TextStyle(
                                color: settings.textColor,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTag(String text) {
    final settings = AppSettings();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: settings.bgColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: settings.accentColor,

          fontWeight: FontWeight.bold,

          fontSize: 12,
        ),
      ),
    );
  }
}