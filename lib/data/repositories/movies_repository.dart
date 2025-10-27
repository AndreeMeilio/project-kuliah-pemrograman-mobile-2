import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movies_app_pertemuan_5_assignment/data/models/movies_model.dart';

class MoviesRepository {

  Future<List<MoviesModel>> getAllDataNowPlaying() async{
    final String jsonData = await rootBundle.loadString("assets/data_now_playing.json");

    final result = moviesModelFromJson(jsonData);

    return result;
  }

  Future<List<MoviesModel>> getAllDataTrending() async{
    final String jsonData = await rootBundle.loadString("assets/data_trending.json");

    final result = moviesModelFromJson(jsonData);

    return result;
  }

  Future<List<MoviesModel>> getAllDataPopuler() async{
    final String jsonData = await rootBundle.loadString("assets/data_populer.json");

    final result = moviesModelFromJson(jsonData);

    return result;
  }

  Future<List<MoviesModel>> getAllDataTopRated() async{
    final String jsonData = await rootBundle.loadString("assets/data_top_rated.json");

    final result = moviesModelFromJson(jsonData);

    return result;
  }
}