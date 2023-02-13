import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required String email,
    required String password,
    required bool isLoading,
  }) = _RegisterState;
}

@freezed
class RegisterSignal with _$RegisterSignal {
  const factory RegisterSignal.registrationComplete() = _RegistrationComplete;

  const factory RegisterSignal.error(String message) = _Error;
}
