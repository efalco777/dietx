import 'package:dietx/app/bloc/base_signal_cubit.dart';
import 'package:dietx/app/model/auth/auth_use_case.dart';
import 'package:dietx/app/pages/auth/register/register_state.dart';

class RegisterBloc extends BaseSignalCubit<RegisterState, RegisterSignal> {
  final AuthUseCase _authUseCase;

  RegisterBloc(this._authUseCase)
      : super(const RegisterState(
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

  Future<void> onRegister() async {
    try {
      emit(state.copyWith(isLoading: true));

      await _authUseCase.register(email: state.email, password: state.password);
      emit(state.copyWith(isLoading: false));
      emitSignal(const RegisterSignal.registrationComplete());
    } catch (error, stackTrace) {
      emit(state.copyWith(isLoading: false));
      emitSignal(RegisterSignal.error('$error $stackTrace'));
    }
  }
}
