import 'package:flutter/material.dart';

import '../config/theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.content});

  final Map<String, dynamic> content;

  @override
  Widget build(BuildContext context) {
    final id = content['id'] as String;
    final title = content['title'] as String;
    final cast = content['cast'] as List<String>;
    final heroTag = content['heroTag'] as String? ?? 'poster-$id';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 420,
            pinned: true,
            backgroundColor: AppTheme.background,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: heroTag,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      content['cloudImageUrl'] as String,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) => progress ==
                              null
                          ? child
                          : Container(
                              color: AppTheme.surface,
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                      errorBuilder: (_, __, ___) => Container(
                        color: AppTheme.surface,
                        alignment: Alignment.center,
                        child: const Icon(Icons.movie, size: 72),
                      ),
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, AppTheme.background],
                          stops: [0.35, 1],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 22,
                      right: 22,
                      bottom: 34,
                      child: Text(
                        title,
                        style: AppTheme.heading.copyWith(fontSize: 31),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: [
                      _MetadataChip(content['year'].toString()),
                      _MetadataChip(content['rating'] as String),
                      _MetadataChip(content['duration'] as String),
                    ],
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Reproduciendo "$title"')),
                      ),
                      icon: const Icon(Icons.play_arrow),
                      label: Text('VER AHORA', style: AppTheme.label),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(content['description'] as String, style: AppTheme.body),
                  const SizedBox(height: 14),
                  Text(
                    'Categoría: ${content['category']}',
                    style: AppTheme.label.copyWith(color: AppTheme.muted),
                  ),
                  const SizedBox(height: 24),
                  Text('Reparto', style: AppTheme.heading.copyWith(fontSize: 20)),
                  const SizedBox(height: 8),
                  // ListView.builder vertical + ListTile para mostrar el reparto.
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cast.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppTheme.primary.withValues(alpha: 0.2),
                          child: const Icon(Icons.person_outline),
                        ),
                        title: Text(cast[index], style: AppTheme.body),
                        subtitle: Text(
                          'Actor / actriz',
                          style: AppTheme.body.copyWith(
                            color: AppTheme.muted,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Más detalles',
                    style: AppTheme.heading.copyWith(fontSize: 20),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.download_outlined),
                    title: Text('Descargar', style: AppTheme.label),
                    subtitle: Text(
                      'Disponible para ver sin conexión',
                      style: AppTheme.body.copyWith(
                        color: AppTheme.muted,
                        fontSize: 12,
                      ),
                    ),
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Descarga añadida a la cola')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetadataChip extends StatelessWidget {
  const _MetadataChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) => Chip(
        label: Text(label, style: AppTheme.label.copyWith(fontSize: 12)),
        backgroundColor: AppTheme.surface,
        side: BorderSide.none,
        visualDensity: VisualDensity.compact,
      );
}
