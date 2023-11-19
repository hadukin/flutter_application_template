import 'package:auto_route/auto_route.dart';
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
      appBar: AppBar(
        title: Text('${widget.userId} ${widget.userName}'),
      ),
    );
  }
}
