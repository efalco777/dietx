import 'package:dietx/app/bloc/base_cubit.dart';
import 'package:dietx/app/model/auth/auth_use_case.dart';
import 'package:dietx/app/model/settings/entity/training_config.dart';
import 'package:dietx/app/model/settings/settings_use_case.dart';
import 'package:dietx/app/pages/settings/settings_state.dart';

class SettingsBloc extends BaseCubit<SettingsState> {
  final AuthUseCase _authUseCase;
  final SettingsUseCase _settingsUseCase;

  SettingsBloc(this._authUseCase, this._settingsUseCase)
      : super(
          const SettingsState(
            content: SettingsContent.loading(),
            trainingConfig: TrainingConfig.empty,
          ),
        );

  Future<void> refresh() async {
    try {
      emit(state.copyWith(
        content: const SettingsContent.loading(),
      ));

      final TrainingConfig trainingConfig = await _settingsUseCase.getTrainingConfig();

      emit(state.copyWith(
        content: const SettingsContent.loaded(),
        trainingConfig: trainingConfig,
      ));
    } catch (e) {
      emit(state.copyWith(content: const SettingsContent.error()));
    }
  }

  void onWeightChanged(int value) {
    emit(state.copyWith(trainingConfig: state.trainingConfig.copyWith(weight: value)));
  }

  void onMealsPerDayChanged(int value) {
    emit(state.copyWith(trainingConfig: state.trainingConfig.copyWith(mealsPerDay: value)));
  }

  void onTrainingTypeChanged(TrainingType value) {
    emit(state.copyWith(trainingConfig: state.trainingConfig.copyWith(trainingType: value)));
  }

  Future<void> submitChanges() async {
    emit(state.copyWith(content: const SettingsContent.loading()));
    try {
      await _settingsUseCase.updateTrainingConfig(state.trainingConfig);
    } catch (e) {
      emit(state.copyWith(content: const SettingsContent.error()));
    }
    emit(state.copyWith(content: const SettingsContent.loaded()));
  }

  Future<void> onLogout() => _authUseCase.logout();
}
