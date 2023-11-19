import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_application_template/presentation/todo/todo_event.dart';
import 'package:flutter_application_template/presentation/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUseCases _todoUseCases;

  TodoBloc({
    required TodoUseCases todoUseCases,
  })  : _todoUseCases = todoUseCases,
        super(TodoState()) {
    on<TodoEvent>(
      (event, emit) => switch (event) {
        final TodoAddEvent event => _onAdd(event, emit),
        final TodoGetAllEvent event => _onGetAll(event, emit),
      },
    );
    add(TodoGetAllEvent());
  }

  Future<void> _onAdd(
    TodoAddEvent event,
    Emitter<TodoState> emit,
  ) async {
    final newTodo = await _todoUseCases.add(event.title);
    emit(state.copyWith(todos: [...state.todos, newTodo]));
  }

  Future<void> _onGetAll(TodoGetAllEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(milliseconds: 500));
    final response = await _todoUseCases.getAll();
    emit(state.copyWith(todos: response, isLoading: false));
  }
}
