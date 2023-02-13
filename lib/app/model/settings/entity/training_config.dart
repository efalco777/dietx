import 'package:dietx/app/model/settings/entity/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_config.freezed.dart';
part 'training_config.g.dart';

@freezed
class TrainingConfig with _$TrainingConfig {
  static const TrainingConfig empty = TrainingConfig(
    weight: minWeight,
    mealsPerDay: minMealsPerDay,
    trainingType: TrainingType.normal,
  );
  static const int minWeight = 30;
  static const int maxWeight = 200;
  static const int minMealsPerDay = 3;
  static const int maxMealsPerDay = 9;

  const factory TrainingConfig({
    @JsonKey(name: ConfigKeys.weight) required int weight,
    @JsonKey(name: ConfigKeys.mealsPerDay) required int mealsPerDay,
    @JsonKey(name: ConfigKeys.trainingType) required TrainingType trainingType,
  }) = _TrainingConfig;

  factory TrainingConfig.fromJson(Map<String, dynamic> json) => _$TrainingConfigFromJson(json);
}

enum TrainingType {
  @JsonValue(ConfigKeys.normal)
  normal,
  @JsonValue(ConfigKeys.strength)
  strength,
}
