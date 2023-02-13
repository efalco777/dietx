// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrainingConfig _$$_TrainingConfigFromJson(Map<String, dynamic> json) =>
    _$_TrainingConfig(
      weight: json['weight'] as int,
      mealsPerDay: json['meals_per_day'] as int,
      trainingType: $enumDecode(_$TrainingTypeEnumMap, json['training_type']),
    );

Map<String, dynamic> _$$_TrainingConfigToJson(_$_TrainingConfig instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'meals_per_day': instance.mealsPerDay,
      'training_type': _$TrainingTypeEnumMap[instance.trainingType]!,
    };

const _$TrainingTypeEnumMap = {
  TrainingType.normal: 'normal',
  TrainingType.strength: 'strength',
};
