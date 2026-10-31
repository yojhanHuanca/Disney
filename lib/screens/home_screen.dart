import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/theme.dart';
import '../data/disney_data.dart';
import '../routes/app_routes.dart';
import '../widgets/content_carousel.dart';
import '../widgets/franchise_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String? _selectedFranchise;

  void _openSearch() {
    showSearch<void>(
      context: context,
      delegate: _ContentSearchDelegate(
        contents: disneyContent,
        onSelect: _openDetail,
      ),
    );
  }

  void _openDetail(Map<String, dynamic> item) {
    Navigator.pushNamed(context, AppRoutes.detail, arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    final visible = _selectedFranchise == null
        ? disneyContent
        : disneyContent
            .where((item) => item['category'] == _selectedFranchise)
            .toList();
    final sections = <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/disney_plus.svg',
              width: 76,
              height: 34,
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Buscar',
              onPressed: _openSearch,
              icon: const Icon(Icons.search),
            ),
            IconButton(
              tooltip: 'Perfil',
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.profile),
              icon: const Icon(Icons.person_outline),
            ),
          ],
        ),
      ),
      _HeroBanner(
        item: disneyContent[0],
        onTap: () => _openDetail(disneyContent[0]),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            title: 'Explora por franquicia',
            trailing: _selectedFranchise == null
                ? null
                : TextButton(
                    onPressed: () => setState(() => _selectedFranchise = null),
                    child: Text('Ver todo', style: AppTheme.label),
                  ),
          ),
          SizedBox(
            height: 110,
            child: ListView.builder(
              // ListView.builder horizontal: tarjetas de franquicia.
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: franchises.length,
              itemBuilder: (context, index) {
                final franchise = franchises[index];
                return FranchiseCard(
                  franchise: franchise,
                  selected: _selectedFranchise == franchise['name'],
                  onTap: () => setState(() {
                    _selectedFranchise =
                        _selectedFranchise == franchise['name']
                            ? null
                            : franchise['name'];
                  }),
                );
              },
            ),
          ),
        ],
      ),
    ];

    if (_selectedFranchise == null) {
      sections.addAll([
        ContentCarousel(
          title: 'Tendencias',
          items: trendingContent,
          onItemTap: _openDetail,
        ),
        ContentCarousel(
          title: 'Aclamadas por la crítica',
          items: acclaimedContent,
          onItemTap: _openDetail,
        ),
        ContentCarousel(
          title: 'Universo Marvel',
          items: marvelContent,
          onItemTap: _openDetail,
        ),
        ContentCarousel(
          title: 'Todo para descubrir',
          items: disneyContent,
          onItemTap: _openDetail,
        ),
      ]);
    } else if (visible.isNotEmpty) {
      sections.add(
        ContentCarousel(
          title: _selectedFranchise!,
          items: visible,
          onItemTap: _openDetail,
        ),
      );
    } else {
      sections.add(
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            'Pronto habrá más historias de $_selectedFranchise.',
            style: AppTheme.body.copyWith(color: AppTheme.muted),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    sections.add(const SizedBox(height: 24));

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          // ListView.builder vertical: composición de secciones de Inicio.
          itemCount: sections.length,
          itemBuilder: (context, index) => sections[index],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          if (index == 1) _openSearch();
          if (index == 3) Navigator.pushNamed(context, AppRoutes.profile);
          if (index == 2) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tus descargas aparecerán aquí.')),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: 'Descargas',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  const _HeroBanner({required this.item, required this.onTap});

  final Map<String, dynamic> item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 2, 14, 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: SizedBox(
            height: 365,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  item['cloudImageUrl'] as String,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: AppTheme.surface,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (_, __, ___) => const _ImageFallback(),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xEE0E111D)],
                      stops: [0.28, 1],
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  right: 22,
                  bottom: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/original_badge.svg',
                        width: 168,
                        height: 34,
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item['title'] as String,
                        style: AppTheme.heading.copyWith(
                          fontSize: 30,
                          shadows: const [
                            Shadow(color: Colors.black87, blurRadius: 12),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      FilledButton.icon(
                        onPressed: onTap,
                        icon: const Icon(Icons.play_arrow),
                        label: Text('VER AHORA', style: AppTheme.label),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();

  @override
  Widget build(BuildContext context) => Container(
        color: const Color(0xFF202A3A),
        alignment: Alignment.center,
        child: const Icon(Icons.movie_outlined, size: 54, color: Colors.white54),
      );
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 16, 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTheme.heading.copyWith(fontSize: 18),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      );
}

class _ContentSearchDelegate extends SearchDelegate<void> {
  _ContentSearchDelegate({required this.contents, required this.onSelect});

  final List<Map<String, dynamic>> contents;
  final ValueChanged<Map<String, dynamic>> onSelect;

  @override
  String get searchFieldLabel => 'Películas, series y más';

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) => _results();

  @override
  Widget buildSuggestions(BuildContext context) => _results();

  Widget _results() {
    final matches = contents
        .where(
          (item) => (item['title'] as String)
              .toLowerCase()
              .contains(query.toLowerCase()),
        )
        .toList();
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final item = matches[index];
        return ListTile(
          leading: const Icon(Icons.movie_outlined),
          title: Text(item['title'] as String),
          subtitle: Text(item['category'] as String),
          onTap: () {
            close(context, null);
            onSelect(item);
          },
        );
      },
    );
  }
}
