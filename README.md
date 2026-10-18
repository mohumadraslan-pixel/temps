# Movie Library App

A Flutter app for browsing a small collection of movies. Search by title or genre, then switch between list and grid layouts.

## Features

- Search movies by title or genre.
- Browse the collection in list or grid view.
- View each movie's rating, release year, and poster.
- Tap the ticket deal on any card to update the offer across the collection.

## Technologies

- Flutter and Dart
- Material icons and local poster images

## Project structure

```text
lib/main.dart       App entry point and theme
lib/home_page.dart  Search, view toggle, and movie list
lib/movie_card.dart Movie card widget
lib/movie.dart      Movie model and sample data
assets/posters/     Local movie poster images
pubspec.yaml        Flutter package and asset configuration
```

## Run the app

Install the Flutter SDK and set up a supported device or emulator. From the project directory, run:

```sh
flutter pub get
flutter run
```