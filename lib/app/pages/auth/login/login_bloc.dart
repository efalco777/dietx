import 'package:dietx/app/bloc/base_signal_cubit.dart';
import 'package:dietx/app/model/auth/auth_use_case.dart';
import 'package:dietx/app/pages/auth/login/login_state.dart';

class LoginBloc extends BaseSignalCubit<LoginState, LoginSignal> {
  final AuthUseCase _authUseCase;

  LoginBloc(this._authUseCase)
      : super(const LoginState(
          email: '',
          password: '',
          isLoading: false,
        ));

  void onEditEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void onEditPassword(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> onLogin() async {
    try {
      emit(state.copyWith(
        isLoading: true,
      ));

      await _authUseCase.login(email: state.email, password: state.password);
      emit(state.copyWith(isLoading: false));
      emitSignal(const LoginSignal.loggedIn());
    } catch (error, stackTrace) {
      emit(state.copyWith(isLoading: false));
      emitSignal(LoginSignal.error('$error $stackTrace'));
    }
  }
}
