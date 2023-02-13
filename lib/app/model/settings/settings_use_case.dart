import 'package:dietx/app/model/settings/entity/training_config.dart';

abstract class SettingsUseCase {
  Future<TrainingConfig> getTrainingConfig();
  Future<void> updateTrainingConfig(TrainingConfig trainingConfig);
}
