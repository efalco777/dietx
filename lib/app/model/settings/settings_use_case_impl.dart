import 'package:dietx/app/model/settings/entity/training_config.dart';
import 'package:dietx/app/model/settings/repository/settings_repository.dart';
import 'package:dietx/app/model/settings/settings_use_case.dart';

class SettingsUseCaseImpl implements SettingsUseCase {
  final SettingsRepository repository;

  SettingsUseCaseImpl(this.repository);

  @override
  Future<TrainingConfig> getTrainingConfig() async {
    return repository.getTrainingConfig();
  }

  @override
  Future<void> updateTrainingConfig(TrainingConfig trainingConfig) async {
    return repository.updateTrainingConfig(trainingConfig);
  }
}
