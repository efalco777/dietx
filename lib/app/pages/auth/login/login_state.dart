import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    required bool isLoading,
  }) = _LoginState;
}

@freezed
class LoginSignal with _$LoginSignal {
  const factory LoginSignal.loggedIn() = _LoggedIn;
  const factory LoginSignal.error(String message) = _Error;
}
