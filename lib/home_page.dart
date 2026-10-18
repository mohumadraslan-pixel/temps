import 'package:flutter/material.dart';

import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchText = '';
  bool _showGrid = false;
  int _discountPercent = 20;

  void _changeDiscount() {
    setState(() {
      _discountPercent = _discountPercent == 1 ? 20 : _discountPercent - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchText = _searchText.trim().toLowerCase();
    final filteredMovies = movies.where((movie) {
      return movie.title.toLowerCase().contains(searchText) ||
          movie.genre.toLowerCase().contains(searchText);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        actions: [
          IconButton(
            tooltip: _showGrid ? 'Show list' : 'Show grid',
            onPressed: () {
              setState(() {
                _showGrid = !_showGrid;
              });
            },
            icon: Icon(_showGrid ? Icons.view_list : Icons.grid_view),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: filteredMovies.isEmpty
                    ? const Center(child: Text('No movies found'))
                    : _showGrid
                        ? GridView.builder(
                            itemCount: filteredMovies.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.56,
                            ),
                            itemBuilder: (context, index) {
                              return MovieCard(
                                movie: filteredMovies[index],
                                isGrid: true,
                                discountPercent: _discountPercent,
                                onDiscountTap: _changeDiscount,
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: filteredMovies.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: MovieCard(
                                  movie: filteredMovies[index],
                                  isGrid: false,
                                  discountPercent: _discountPercent,
                                  onDiscountTap: _changeDiscount,
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}