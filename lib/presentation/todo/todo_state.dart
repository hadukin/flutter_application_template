import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

@freezed
abstract class TodoState with _$TodoState {
  const factory TodoState({@Default(false) bool isLoading, @Default([]) List<TodoEntity> todos}) = _TodoState;
}
