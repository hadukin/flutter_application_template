import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/constants.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service.dart';
import 'package:flutter_application_template/theme/gap.dart';

enum SnackBarType { success, error, warning, info, message }

class SnackBarServiceImpl implements SnackBarService {
  @override
  void showSnackBar({
    required String message,
    SnackBarType type = SnackBarType.message,
  }) {
    final SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: switch (type) {
        SnackBarType.error => Row(
            children: [
              const Icon(
                CupertinoIcons.clear_circled,
                color: CupertinoColors.systemRed,
              ),
              const SizedBox(width: Gap.m),
              Text(message),
            ],
          ),
        SnackBarType.success => Row(
            children: [
              const Icon(
                CupertinoIcons.check_mark_circled,
                color: CupertinoColors.systemGreen,
              ),
              const SizedBox(width: Gap.m),
              Text(message),
            ],
          ),
        SnackBarType.info => Row(
            children: [
              const Icon(
                Icons.close,
                color: CupertinoColors.systemBlue,
              ),
              const SizedBox(width: Gap.m),
              Text(message),
            ],
          ),
        SnackBarType.warning => Row(
            children: [
              const Icon(
                Icons.close,
                color: CupertinoColors.systemYellow,
              ),
              const SizedBox(width: Gap.m),
              Text(message),
            ],
          ),
        SnackBarType.message => Row(
            children: [
              Text(message),
            ],
          ),
      },
    );
    Constants.scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
