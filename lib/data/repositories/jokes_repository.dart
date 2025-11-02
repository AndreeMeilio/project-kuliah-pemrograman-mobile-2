
import 'package:dio/dio.dart';
import 'package:state_management_practice/data/core/api_config.dart';
import 'package:state_management_practice/data/core/api_response.dart';
import 'package:state_management_practice/data/models/jokes.dart';

class JokesRepository {
  static JokesRepository? _instance;

  JokesRepository._();

  static JokesRepository getInstance(){
    return _instance ??= JokesRepository._();
  }

  final api = ApiConfig.getInstance();

  Future<ApiResponse> getRandomJokes() async{
    final result = await api.getDio().request("/random_joke");

    return ApiResponse<Jokes>(
      code: "00", 
      message: "Mendapatkan random jokes berhasil", 
      data: Jokes.fromJson(result.data)
    );
  }
}