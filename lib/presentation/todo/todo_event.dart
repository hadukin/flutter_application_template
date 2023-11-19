sealed class TodoEvent {
  const TodoEvent();
}

final class TodoAddEvent extends TodoEvent {
  final String title;

  const TodoAddEvent(this.title);
}

final class TodoGetAllEvent extends TodoEvent {}
