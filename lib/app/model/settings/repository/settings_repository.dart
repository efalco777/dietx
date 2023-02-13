import 'package:dietx/app/model/settings/entity/training_config.dart';

abstract class SettingsRepository {
  Future<TrainingConfig> getTrainingConfig();
  Future<void> updateTrainingConfig(TrainingConfig trainingConfig);
}
