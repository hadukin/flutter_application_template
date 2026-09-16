import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_application_template/presentation/todo/todo_event.dart';
import 'package:flutter_application_template/presentation/todo/todo_state.dart';

class TodoBloc({
  required final TodoAddUseCase _todoAddUseCase,
  required final TodoGetAllUseCase _todoGetAllUseCase,
}) extends Bloc<TodoEvent, TodoState> {
  this : super(TodoState()) {
    on<TodoEvent>(
      (event, emit) => switch (event) {
        final TodoAddEvent event => _onAdd(event, emit),
        final TodoGetAllEvent event => _onGetAll(event, emit),
      },
    );
    add(TodoGetAllEvent());
  }

  Future<void> _onAdd(TodoAddEvent event, Emitter<TodoState> emit) async {
    final (:data, :err) = await _todoAddUseCase(
      TodoAddUseCaseParam(event.title),
    );
    if (err != null) {
      // Show error
      return;
    }

    emit(state.copyWith(todos: [...state.todos, ?data]));
  }

  Future<void> _onGetAll(TodoGetAllEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(milliseconds: 500));
    final (:data, :err) = await _todoGetAllUseCase(EmptyUseCaseParam());

    if (err != null) {
      // Show error
      return;
    }

    emit(state.copyWith(todos: data ?? [], isLoading: false));
  }
}
