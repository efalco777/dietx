import 'package:dietx/app/model/settings/entity/training_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required SettingsContent content,
    required TrainingConfig trainingConfig,
  }) = _SettingsState;
}

@freezed
class SettingsContent with _$SettingsContent {
  const factory SettingsContent.loading() = _Loading;
  const factory SettingsContent.loaded() = _Loaded;
  const factory SettingsContent.error() = _Error;
}
