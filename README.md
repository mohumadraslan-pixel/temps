# Dice Game

A small Flutter game that rolls two dice and shows whether their total is a win.

## Features

- Roll two dice and see their total.
- Win with a total of 10 or more; otherwise, lose.
- Reset both dice to 1.
- Happy and sad illustrations show the result.

## Technologies

- Flutter and Dart
- Material icons and local PNG assets

## Project structure

```text
assets/       Happy and sad result images
lib/main.dart App and game screen
lib/dice.dart Dice face widget
pubspec.yaml  Flutter package and asset configuration
```

## Run the app

Install the Flutter SDK and set up a supported device or emulator. From the project directory, run:

```sh
flutter pub get
flutter run
```