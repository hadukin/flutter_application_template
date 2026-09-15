import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service.dart';
import 'package:flutter_application_template/ui_di_module.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'launch_state.dart';

part 'launch_view_model.freezed.dart';

class LaunchViewModel({
  required final LoginUseCase _loginUseCase,
  required final Graph _router,
  required final SnackBarService _snackBarService,
}) extends Cubit<LaunchState> {
  this : super(LaunchState());

  Future<void> signIn() async {
    emit(state.copyWith(isLoading: true));

    final (:data, :err) = await _loginUseCase(LoginUseCaseParam('test@test.com', '12345678'));

    if (err != null) {
      emit(state.copyWith(isLoading: false));
      _snackBarService.showSnackBar(message: '$err');
      return;
    }

    emit(state.copyWith(isLoading: false, user: data));
    _router.navigator.navigate('/home');
  }
}
