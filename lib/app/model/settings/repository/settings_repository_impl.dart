import 'package:dietx/app/firebase/references/reference_getter.dart';
import 'package:dietx/app/model/settings/entity/training_config.dart';
import 'package:dietx/app/model/settings/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final AppDocumentGetter<TrainingConfig> _trainingConfig;

  SettingsRepositoryImpl(this._trainingConfig);

  @override
  Future<TrainingConfig> getTrainingConfig() async {
    final TrainingConfig? config = await _trainingConfig().get().then((snapshot) => snapshot.data());
    if (config != null) {
      return config;
    }
    const newConfig = TrainingConfig.empty;
    await updateTrainingConfig(newConfig);
    return newConfig;
  }

  @override
  Future<void> updateTrainingConfig(TrainingConfig trainingConfig) async {
    return _trainingConfig().set(trainingConfig);
  }
}
