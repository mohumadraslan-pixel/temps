class Movie {
  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });

  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;
}

final List<Movie> movies = [
  const Movie(
    title: 'Inception',
    genre: 'Sci-Fi',
    year: 2010,
    rating: 8.8,
    image: 'assets/posters/inception.png',
  ),
  const Movie(
    title: 'Interstellar',
    genre: 'Sci-Fi',
    year: 2014,
    rating: 8.7,
    image: 'assets/posters/interstellar.png',
  ),
  const Movie(
    title: 'The Dark Knight',
    genre: 'Action',
    year: 2008,
    rating: 9.0,
    image: 'assets/posters/dark_knight.png',
  ),
  const Movie(
    title: 'The Matrix',
    genre: 'Action',
    year: 1999,
    rating: 8.7,
    image: 'assets/posters/matrix.png',
  ),
  const Movie(
    title: 'Spirited Away',
    genre: 'Animation',
    year: 2001,
    rating: 8.6,
    image: 'assets/posters/spirited_away.png',
  ),
  const Movie(
    title: 'Parasite',
    genre: 'Thriller',
    year: 2019,
    rating: 8.5,
    image: 'assets/posters/parasite.png',
  ),
  const Movie(
    title: 'Dune',
    genre: 'Adventure',
    year: 2021,
    rating: 8.0,
    image: 'assets/posters/dune.png',
  ),
  const Movie(
    title: 'Coco',
    genre: 'Animation',
    year: 2017,
    rating: 8.4,
    image: 'assets/posters/coco.png',
  ),
];