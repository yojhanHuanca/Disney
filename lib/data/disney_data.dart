// Listas y mapas locales (List<Map<String, dynamic>>) usados como catálogo mock.
// localImagePath apunta a logos SVG locales; cloudImageUrl se carga con Image.network.
const List<Map<String, dynamic>> disneyContent = [
  {
    'id': 'luca',
    'title': 'Luca',
    'description':
        'En un verano inolvidable en la Riviera italiana, Luca descubre un mundo nuevo junto a su amigo Alberto.',
    'category': 'Pixar',
    'rating': 'PG',
    'year': 2021,
    'duration': '1 h 35 min',
    'localImagePath': 'assets/images/pixar.svg',
    'cloudImageUrl':
        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200&auto=format&fit=crop&q=85',
    'cast': ['Jacob Tremblay', 'Jack Dylan Grazer', 'Emma Berman'],
  },
  {
    'id': 'black-panther',
    'title': 'Black Panther: Wakanda por siempre',
    'description':
        'Wakanda debe proteger su futuro mientras honra el legado de su rey.',
    'category': 'Marvel',
    'rating': 'PG-13',
    'year': 2022,
    'duration': '2 h 41 min',
    'localImagePath': 'assets/images/marvel.svg',
    'cloudImageUrl':
        'https://images.unsplash.com/photo-1534796636912-3b95b3ab5986?w=1200&auto=format&fit=crop&q=85',
    'cast': ['Letitia Wright', 'Lupita Nyongué', 'Danai Gurira'],
  },
  {
    'id': 'mandalorian',
    'title': 'The Mandalorian',
    'description':
        'Un cazador solitario recorre los confines de la galaxia con un pequeño compañero.',
    'category': 'Star Wars',
    'rating': 'TV-14',
    'year': 2019,
    'duration': '3 temporadas',
    'localImagePath': 'assets/images/star_wars.svg',
    'cloudImageUrl':
        'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=1200&auto=format&fit=crop&q=85',
    'cast': ['Pedro Pascal', 'Katee Sackhoff', 'Giancarlo Esposito'],
  },
  {
    'id': 'encanto',
    'title': 'Encanto',
    'description':
        'En una casa mágica, Mirabel es la única Madrigal sin un don extraordinario; su familia la necesita más que nunca.',
    'category': 'Disney',
    'rating': 'PG',
    'year': 2021,
    'duration': '1 h 42 min',
    'localImagePath': 'assets/images/disney.svg',
    'cloudImageUrl':
        'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=1200&auto=format&fit=crop&q=85',
    'cast': ['Stephanie Beatriz', 'María Cecilia Botero', 'John Leguizamo'],
  },
  {
    'id': 'free-solo',
    'title': 'Free Solo',
    'description':
        'Un retrato íntimo de Alex Honnold mientras se prepara para escalar El Capitán sin cuerdas.',
    'category': 'National Geographic',
    'rating': 'PG-13',
    'year': 2018,
    'duration': '1 h 40 min',
    'localImagePath': 'assets/images/natgeo.svg',
    'cloudImageUrl':
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=1200&auto=format&fit=crop&q=85',
    'cast': ['Alex Honnold', 'Sanni McCandless', 'Tommy Caldwell'],
  },
  {
    'id': 'soul',
    'title': 'Soul',
    'description':
        'Un músico descubre el sentido de la vida al emprender un viaje inesperado.',
    'category': 'Pixar',
    'rating': 'PG',
    'year': 2020,
    'duration': '1 h 40 min',
    'localImagePath': 'assets/images/pixar.svg',
    'cloudImageUrl':
        'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=1200&auto=format&fit=crop&q=85',
    'cast': ['Jamie Foxx', 'Tina Fey', 'Graham Norton'],
  },
  {
    'id': 'guardians',
    'title': 'Guardianes de la Galaxia Vol. 3',
    'description':
        'Los Guardianes se embarcan en una misión que podría cambiar su equipo para siempre.',
    'category': 'Marvel',
    'rating': 'PG-13',
    'year': 2023,
    'duration': '2 h 30 min',
    'localImagePath': 'assets/images/marvel.svg',
    'cloudImageUrl':
        'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=1200&auto=format&fit=crop&q=85',
    'cast': ['Chris Pratt', 'Zoe Saldaña', 'Dave Bautista'],
  },
];

final List<Map<String, dynamic>> trendingContent = [
  disneyContent[0],
  disneyContent[1],
  disneyContent[2],
  disneyContent[3],
  disneyContent[6],
];

final List<Map<String, dynamic>> acclaimedContent = [
  disneyContent[4],
  disneyContent[5],
  disneyContent[0],
  disneyContent[3],
];

final List<Map<String, dynamic>> marvelContent = [
  disneyContent[1],
  disneyContent[6],
];

const List<Map<String, String>> franchises = [
  {'name': 'Disney', 'asset': 'assets/images/disney.svg'},
  {'name': 'Pixar', 'asset': 'assets/images/pixar.svg'},
  {'name': 'Marvel', 'asset': 'assets/images/marvel.svg'},
  {'name': 'Star Wars', 'asset': 'assets/images/star_wars.svg'},
  {'name': 'National Geographic', 'asset': 'assets/images/natgeo.svg'},
];
