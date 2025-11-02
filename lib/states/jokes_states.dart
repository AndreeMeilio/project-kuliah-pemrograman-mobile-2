
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:state_management_practice/data/models/jokes.dart';
import 'package:state_management_practice/data/repositories/jokes_repository.dart';

class JokesStates {
  static final _jokesRepository = JokesRepository.getInstance();

  static final randomJokesValue = FutureProvider<Jokes>((ref) async{
    final result = await _jokesRepository.getRandomJokes();

    return result.data as Jokes;
  });
}