

import 'package:core/utils/generic_state.dart';
import 'package:todos/domain/entities/todos.dart';
import 'package:todos/domain/repositories/todos_repository.dart';
import 'package:todos/domain/usecases/delete_todos.dart';
import 'package:todos/domain/usecases/get_todos.dart';
import 'package:todos/domain/usecases/insert_todos.dart';
import 'package:todos/presentation/states/todos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosCubit extends Cubit<GenericState>{
  
  final GetTodos _getTodos;
  final InsertTodos _insertTodos;
  final DeleteTodos _deleteTodos;

  TodosCubit({
    required GetTodos getTodos,
    required InsertTodos insertTodos,
    required DeleteTodos deleteTodos
  }) 
  : _getTodos = getTodos,
    _insertTodos = insertTodos,
    _deleteTodos = deleteTodos,
    super(GenericState<Todos, TodosState>()); 

  GenericState getState = GenericState<List<TodosData>, TodosState>(
    state: TodosInitialState()
  );

  Future<void> getDataTodos() async{
    try {
      getState = GenericState<List<TodosData>, TodosState>(
        state: TodosLoadingState()
      );
      emit(getState);

      final dataTodos = await _getTodos();

      getState = GenericState<List<TodosData>, TodosState>(
        data: dataTodos.data,
        status: dataTodos.status,
        message: dataTodos.message,
        state: TodosLoadedState()
      );
      emit(getState);

    } catch (e){
      getState = GenericState<List<TodosData>, TodosState>(
        state: TodosFailedState()
      );
      emit(getState);
    }
  }

  GenericState insertTodos = GenericState<TodosData, TodosState>(
    state: TodosInitialState()
  );

  Future<GenericState> insertDataTodos({
    required String judul,
    required String subJudul,
    required String content,
  }) async{
    try {
      insertTodos = GenericState<List<TodosData>, TodosState>(
        state: TodosLoadingState()
      );
      emit(insertTodos);

      final dataTodos = await _insertTodos(
        data: TodosData(
          title: judul,
          subTitle: subJudul,
          content: content,
          createAt: DateTime.now()
        )
      );

      insertTodos = GenericState<List<TodosData>, TodosState>(
        data: dataTodos.data,
        status: dataTodos.status,
        message: dataTodos.message,
        state: TodosLoadedState()
      );
      emit(insertTodos);

      return insertTodos;
    } catch (e){
      insertTodos = GenericState<List<TodosData>, TodosState>(
        state: TodosFailedState()
      );
      emit(insertTodos);

      return insertTodos;
    }
  }

  GenericState deleteTodo = GenericState<List<TodosData>, TodosState>(
    state: TodosInitialState()
  );

  Future<GenericState> deleteTodos({required TodosData data}) async{
    try {
      deleteTodo = GenericState<List<TodosData>, TodosState>(
        state: TodosLoadingState()
      );
      emit(deleteTodo);

      final result = await _deleteTodos(
        todosData: data
      );

      deleteTodo = GenericState<List<TodosData>, TodosState>(
        data: result.data,
        status: result.status,
        message: result.message,
        state: TodosLoadedState()
      );
      emit(deleteTodo);

      return deleteTodo;

    } catch (e){
      deleteTodo = GenericState<List<TodosData>, TodosState>(
        state: TodosFailedState()
      );
      emit(deleteTodo);

      return deleteTodo;
    }
  }
}