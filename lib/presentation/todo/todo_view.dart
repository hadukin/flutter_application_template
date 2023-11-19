import 'package:auto_route/auto_route.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/presentation/todo/todo_bloc.dart';
import 'package:flutter_application_template/presentation/todo/todo_event.dart';
import 'package:flutter_application_template/presentation/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(todoUseCases: Di.instance.getIt()),
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Todo'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                ),
                Expanded(
                  child: state.isLoading
                      ? Center(child: CircularProgressIndicator.adaptive())
                      : ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(height: 8),
                          itemCount: state.todos.length,
                          itemBuilder: (context, index) {
                            final todo = state.todos[index];

                            return ListTile(
                              title: Text(todo.title),
                            );
                          },
                        ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                if (controller.text.isEmpty) return;

                context.read<TodoBloc>().add(TodoAddEvent(controller.text));
                controller.text = '';
              },
            ),
          );
        },
      ),
    );
  }
}
