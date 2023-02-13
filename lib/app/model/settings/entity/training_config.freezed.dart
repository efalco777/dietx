// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrainingConfig _$TrainingConfigFromJson(Map<String, dynamic> json) {
  return _TrainingConfig.fromJson(json);
}

/// @nodoc
mixin _$TrainingConfig {
  @JsonKey(name: ConfigKeys.weight)
  int get weight => throw _privateConstructorUsedError;
  @JsonKey(name: ConfigKeys.mealsPerDay)
  int get mealsPerDay => throw _privateConstructorUsedError;
  @JsonKey(name: ConfigKeys.trainingType)
  TrainingType get trainingType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainingConfigCopyWith<TrainingConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingConfigCopyWith<$Res> {
  factory $TrainingConfigCopyWith(
          TrainingConfig value, $Res Function(TrainingConfig) then) =
      _$TrainingConfigCopyWithImpl<$Res, TrainingConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: ConfigKeys.weight) int weight,
      @JsonKey(name: ConfigKeys.mealsPerDay) int mealsPerDay,
      @JsonKey(name: ConfigKeys.trainingType) TrainingType trainingType});
}

/// @nodoc
class _$TrainingConfigCopyWithImpl<$Res, $Val extends TrainingConfig>
    implements $TrainingConfigCopyWith<$Res> {
  _$TrainingConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = null,
    Object? mealsPerDay = null,
    Object? trainingType = null,
  }) {
    return _then(_value.copyWith(
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      mealsPerDay: null == mealsPerDay
          ? _value.mealsPerDay
          : mealsPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      trainingType: null == trainingType
          ? _value.trainingType
          : trainingType // ignore: cast_nullable_to_non_nullable
              as TrainingType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainingConfigCopyWith<$Res>
    implements $TrainingConfigCopyWith<$Res> {
  factory _$$_TrainingConfigCopyWith(
          _$_TrainingConfig value, $Res Function(_$_TrainingConfig) then) =
      __$$_TrainingConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: ConfigKeys.weight) int weight,
      @JsonKey(name: ConfigKeys.mealsPerDay) int mealsPerDay,
      @JsonKey(name: ConfigKeys.trainingType) TrainingType trainingType});
}

/// @nodoc
class __$$_TrainingConfigCopyWithImpl<$Res>
    extends _$TrainingConfigCopyWithImpl<$Res, _$_TrainingConfig>
    implements _$$_TrainingConfigCopyWith<$Res> {
  __$$_TrainingConfigCopyWithImpl(
      _$_TrainingConfig _value, $Res Function(_$_TrainingConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = null,
    Object? mealsPerDay = null,
    Object? trainingType = null,
  }) {
    return _then(_$_TrainingConfig(
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      mealsPerDay: null == mealsPerDay
          ? _value.mealsPerDay
          : mealsPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      trainingType: null == trainingType
          ? _value.trainingType
          : trainingType // ignore: cast_nullable_to_non_nullable
              as TrainingType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrainingConfig implements _TrainingConfig {
  const _$_TrainingConfig(
      {@JsonKey(name: ConfigKeys.weight) required this.weight,
      @JsonKey(name: ConfigKeys.mealsPerDay) required this.mealsPerDay,
      @JsonKey(name: ConfigKeys.trainingType) required this.trainingType});

  factory _$_TrainingConfig.fromJson(Map<String, dynamic> json) =>
      _$$_TrainingConfigFromJson(json);

  @override
  @JsonKey(name: ConfigKeys.weight)
  final int weight;
  @override
  @JsonKey(name: ConfigKeys.mealsPerDay)
  final int mealsPerDay;
  @override
  @JsonKey(name: ConfigKeys.trainingType)
  final TrainingType trainingType;

  @override
  String toString() {
    return 'TrainingConfig(weight: $weight, mealsPerDay: $mealsPerDay, trainingType: $trainingType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainingConfig &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.mealsPerDay, mealsPerDay) ||
                other.mealsPerDay == mealsPerDay) &&
            (identical(other.trainingType, trainingType) ||
                other.trainingType == trainingType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, weight, mealsPerDay, trainingType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainingConfigCopyWith<_$_TrainingConfig> get copyWith =>
      __$$_TrainingConfigCopyWithImpl<_$_TrainingConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrainingConfigToJson(
      this,
    );
  }
}

abstract class _TrainingConfig implements TrainingConfig {
  const factory _TrainingConfig(
      {@JsonKey(name: ConfigKeys.weight)
          required final int weight,
      @JsonKey(name: ConfigKeys.mealsPerDay)
          required final int mealsPerDay,
      @JsonKey(name: ConfigKeys.trainingType)
          required final TrainingType trainingType}) = _$_TrainingConfig;

  factory _TrainingConfig.fromJson(Map<String, dynamic> json) =
      _$_TrainingConfig.fromJson;

  @override
  @JsonKey(name: ConfigKeys.weight)
  int get weight;
  @override
  @JsonKey(name: ConfigKeys.mealsPerDay)
  int get mealsPerDay;
  @override
  @JsonKey(name: ConfigKeys.trainingType)
  TrainingType get trainingType;
  @override
  @JsonKey(ignore: true)
  _$$_TrainingConfigCopyWith<_$_TrainingConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
