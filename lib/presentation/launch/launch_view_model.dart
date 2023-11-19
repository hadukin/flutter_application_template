import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'launch_state.dart';

part 'launch_view_model.freezed.dart';

class LaunchViewModel extends Cubit<LaunchState> {
  final SignInUseCase _signInUseCase;
  final IRouter _router;
  final SnackBarService _snackBarService;

  LaunchViewModel({
    required IRouter router,
    required SnackBarService snackBarService,
    required SignInUseCase signInUseCase,
  })  : _router = router,
        _snackBarService = snackBarService,
        _signInUseCase = signInUseCase,
        super(LaunchState());

  Future<void> signIn() async {
    emit(state.copyWith(isLoading: true));
    final result = await _signInUseCase(SignInParams(
      email: 'test@test.com',
      password: '12345678',
    ));

    switch (result) {
      case UseCaseSuccess(:final data):
        emit(state.copyWith(isLoading: false));
        _router.navigator.navigate('/home');
      case UseCaseFailure(:final exception):
        emit(state.copyWith(isLoading: false));
        _snackBarService.showSnackBar(message: '$exception');
    }
  }
}
