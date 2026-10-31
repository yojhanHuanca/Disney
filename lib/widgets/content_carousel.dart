import 'package:flutter/material.dart';

import '../config/theme.dart';

class ContentCarousel extends StatelessWidget {
  const ContentCarousel({
    super.key,
    required this.title,
    required this.items,
    required this.onItemTap,
  });

  final String title;
  final List<Map<String, dynamic>> items;
  final ValueChanged<Map<String, dynamic>> onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 22, 18, 10),
          child: Text(title, style: AppTheme.heading.copyWith(fontSize: 18)),
        ),
        SizedBox(
          height: 190,
          child: ListView.builder(
            // ListView.builder horizontal: carruseles de contenido por categoría.
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final id = item['id'] as String;
              final heroTag = 'poster-$title-$id';
              return SizedBox(
                width: 138,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Card(
                    // Card redondeada para enmarcar cada póster remoto.
                    child: InkWell(
                      onTap: () => onItemTap({...item, 'heroTag': heroTag}),
                      child: Hero(
                        tag: heroTag,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              item['cloudImageUrl'] as String,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) =>
                                  progress == null
                                      ? child
                                      : Container(
                                          color: AppTheme.surface,
                                          alignment: Alignment.center,
                                          child: const SizedBox(
                                            width: 22,
                                            height: 22,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          ),
                                        ),
                              errorBuilder: (_, __, ___) => Container(
                                color: const Color(0xFF263248),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.movie_outlined,
                                  color: Colors.white54,
                                  size: 38,
                                ),
                              ),
                            ),
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Color(0xCC0E111D),
                                  ],
                                  stops: [0.5, 1],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9,
                              right: 8,
                              bottom: 9,
                              child: Text(
                                item['title'] as String,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.label.copyWith(fontSize: 13),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: IconButton(
                                visualDensity: VisualDensity.compact,
                                tooltip: 'Añadir a mi lista',
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.black45,
                                ),
                                onPressed: () => ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${item['title']} añadido a Mi lista',
                                    ),
                                  ),
                                ),
                                icon: const Icon(Icons.add, size: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
