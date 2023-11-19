import 'package:bloc/bloc.dart';
import 'package:core/router/base_router.dart';
import 'package:core/use_case/use_case_base.dart';

import 'package:domain/domain.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service_impl.dart';
import 'package:flutter_application_template/utils/field_validator_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'launch_state.dart';

part 'launch_view_model.freezed.dart';

class LaunchViewModel extends Cubit<LaunchState> with FieldValidatorMixin {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  final IsAuthorizedUseCase _isAuthorizedUseCase;
  final BaseRouter _router;
  final SnackBarService _snackBarService;

  LaunchViewModel({
    required BaseRouter router,
    required SnackBarService snackBarService,
    required SignUpUseCase signUpUseCase,
    required IsAuthorizedUseCase isAuthorizedUseCase,
    required SignInUseCase signInUseCase,
  })  : _signUpUseCase = signUpUseCase,
        _isAuthorizedUseCase = isAuthorizedUseCase,
        _router = router,
        _snackBarService = snackBarService,
        _signInUseCase = signInUseCase,
        super(LaunchState.initial());

  Future<void> signUp({
    required String email,
  }) async {
    final isValidEmailField = isValidEmail(email);

    if (!isValidEmailField) {
      _snackBarService.showSnackBar(
        message: 'Email is not valid',
        type: SnackBarType.error,
      );
      return;
    }

    final result = await _signUpUseCase(SignUpParams(
      email: email,
      password: '12345678',
    ));

    switch (result) {
      case UseCaseSuccess(:final data):
        print('SIGN_UP $data');
      case UseCaseFailure(:final exception):
        _snackBarService.showSnackBar(message: '$exception');
    }
  }

  Future<void> signIn() async {
    final result = await _signInUseCase(SignInParams(
      email: 'test@test.com',
      password: '12345678',
    ));

    switch (result) {
      case UseCaseSuccess(:final data):
        _router.navigator.navigate('/home');
      case UseCaseFailure(:final exception):
        _snackBarService.showSnackBar(message: '$exception');
    }
  }

  @override
  Future<void> close() {
    print('CLOSE: LaunchViewModel');
    return super.close();
  }
}
