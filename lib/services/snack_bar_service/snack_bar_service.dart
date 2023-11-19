import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service_impl.dart';

abstract interface class SnackBarService {
  void showSnackBar({
    required String message,
    SnackBarType type = SnackBarType.message,
  });
}
