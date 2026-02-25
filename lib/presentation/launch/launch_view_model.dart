import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_application_template/services/snack_bar_service/snack_bar_service.dart';
import 'package:flutter_application_template/ui_di_module.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'launch_state.dart';

part 'launch_view_model.freezed.dart';

class LaunchViewModel extends Cubit<LaunchState> {
  final AuthorizationUseCase _authorizationUseCase;
  final Graph _router;
  final SnackBarService _snackBarService;

  LaunchViewModel({
    required Graph router,
    required SnackBarService snackBarService,
    required AuthorizationUseCase authorizationUseCase,
  }) : _router = router,
       _snackBarService = snackBarService,
       _authorizationUseCase = authorizationUseCase,
       super(LaunchState());

  Future<void> signIn() async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await _authorizationUseCase.signIn(email: 'test@test.com', password: '12345678');
      emit(state.copyWith(isLoading: false, user: result));
      _router.navigator.navigate('/home');
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      _snackBarService.showSnackBar(message: '$e');
    }
  }
}
