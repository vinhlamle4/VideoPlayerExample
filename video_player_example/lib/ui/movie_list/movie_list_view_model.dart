import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player_example/data/model/movie.dart';

final movieListProvider = ChangeNotifierProvider.autoDispose((_) => MovieListViewModel());

class MovieListViewModel extends ChangeNotifier {
  AsyncValue<List<Movie>> asyncMovie = const AsyncValue.loading();

  fetchMovie() async {
    final data = await rootBundle.load("assets/json/movies.json");
    final List<dynamic> map = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );

    final movies = <Movie>[];

    for (var value in map) {
      movies.add(Movie.fromJson(value));
    }

    Future.delayed(const Duration(seconds: 1) , () {
      asyncMovie = AsyncValue.data(movies);
      notifyListeners();
    });
  }
}