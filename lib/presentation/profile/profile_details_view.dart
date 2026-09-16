import 'package:auto_route/auto_route.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileDetailsView extends StatefulWidget {
  final String? userId;
  final String? userName;

  const ProfileDetailsView({
    super.key,
    @PathParam('userId') this.userId,
    @QueryParam('userName') this.userName,
  });

  @override
  State<ProfileDetailsView> createState() => _ProfileDetailsViewState();
}

class _ProfileDetailsViewState extends State<ProfileDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.userId} ${widget.userName}')),
      body: DiScopeProvider<TodoDiModule>(
        scope: TodoDiModule(),
        builder: (context, scope) {
          return Column(
            children: [
              Text('${scope.name}'),
              ElevatedButton(
                onPressed: () {
                  scope.todoGetAllUseCase(EmptyUseCaseParam());
                },
                child: Text('get all'),
              ),
            ],
          );
        },
      ),
    );
  }
}
