// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Food _$FoodFromJson(Map<String, dynamic> json) {
  return _Food.fromJson(json);
}

/// @nodoc
mixin _$Food {
  @JsonKey(name: FoodKeys.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: FoodKeys.name)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: FoodKeys.imageUrl)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: FoodKeys.proteins)
  int get proteins => throw _privateConstructorUsedError;
  @JsonKey(name: FoodKeys.carbohydrates)
  int get carbohydrates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res, Food>;
  @useResult
  $Res call(
      {@JsonKey(name: FoodKeys.id) String id,
      @JsonKey(name: FoodKeys.name) String name,
      @JsonKey(name: FoodKeys.imageUrl) String? imageUrl,
      @JsonKey(name: FoodKeys.proteins) int proteins,
      @JsonKey(name: FoodKeys.carbohydrates) int carbohydrates});
}

/// @nodoc
class _$FoodCopyWithImpl<$Res, $Val extends Food>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? proteins = null,
    Object? carbohydrates = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      proteins: null == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as int,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$_FoodCopyWith(_$_Food value, $Res Function(_$_Food) then) =
      __$$_FoodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: FoodKeys.id) String id,
      @JsonKey(name: FoodKeys.name) String name,
      @JsonKey(name: FoodKeys.imageUrl) String? imageUrl,
      @JsonKey(name: FoodKeys.proteins) int proteins,
      @JsonKey(name: FoodKeys.carbohydrates) int carbohydrates});
}

/// @nodoc
class __$$_FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res, _$_Food>
    implements _$$_FoodCopyWith<$Res> {
  __$$_FoodCopyWithImpl(_$_Food _value, $Res Function(_$_Food) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? proteins = null,
    Object? carbohydrates = null,
  }) {
    return _then(_$_Food(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      proteins: null == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as int,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Food implements _Food {
  const _$_Food(
      {@JsonKey(name: FoodKeys.id) required this.id,
      @JsonKey(name: FoodKeys.name) required this.name,
      @JsonKey(name: FoodKeys.imageUrl) required this.imageUrl,
      @JsonKey(name: FoodKeys.proteins) required this.proteins,
      @JsonKey(name: FoodKeys.carbohydrates) required this.carbohydrates});

  factory _$_Food.fromJson(Map<String, dynamic> json) => _$$_FoodFromJson(json);

  @override
  @JsonKey(name: FoodKeys.id)
  final String id;
  @override
  @JsonKey(name: FoodKeys.name)
  final String name;
  @override
  @JsonKey(name: FoodKeys.imageUrl)
  final String? imageUrl;
  @override
  @JsonKey(name: FoodKeys.proteins)
  final int proteins;
  @override
  @JsonKey(name: FoodKeys.carbohydrates)
  final int carbohydrates;

  @override
  String toString() {
    return 'Food(id: $id, name: $name, imageUrl: $imageUrl, proteins: $proteins, carbohydrates: $carbohydrates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Food &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.proteins, proteins) ||
                other.proteins == proteins) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, imageUrl, proteins, carbohydrates);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodCopyWith<_$_Food> get copyWith =>
      __$$_FoodCopyWithImpl<_$_Food>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodToJson(
      this,
    );
  }
}

abstract class _Food implements Food {
  const factory _Food(
      {@JsonKey(name: FoodKeys.id)
          required final String id,
      @JsonKey(name: FoodKeys.name)
          required final String name,
      @JsonKey(name: FoodKeys.imageUrl)
          required final String? imageUrl,
      @JsonKey(name: FoodKeys.proteins)
          required final int proteins,
      @JsonKey(name: FoodKeys.carbohydrates)
          required final int carbohydrates}) = _$_Food;

  factory _Food.fromJson(Map<String, dynamic> json) = _$_Food.fromJson;

  @override
  @JsonKey(name: FoodKeys.id)
  String get id;
  @override
  @JsonKey(name: FoodKeys.name)
  String get name;
  @override
  @JsonKey(name: FoodKeys.imageUrl)
  String? get imageUrl;
  @override
  @JsonKey(name: FoodKeys.proteins)
  int get proteins;
  @override
  @JsonKey(name: FoodKeys.carbohydrates)
  int get carbohydrates;
  @override
  @JsonKey(ignore: true)
  _$$_FoodCopyWith<_$_Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FoodData {
  String get name => throw _privateConstructorUsedError;
  int get proteins => throw _privateConstructorUsedError;
  int get carbohydrates => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodDataCopyWith<FoodData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodDataCopyWith<$Res> {
  factory $FoodDataCopyWith(FoodData value, $Res Function(FoodData) then) =
      _$FoodDataCopyWithImpl<$Res, FoodData>;
  @useResult
  $Res call({String name, int proteins, int carbohydrates});
}

/// @nodoc
class _$FoodDataCopyWithImpl<$Res, $Val extends FoodData>
    implements $FoodDataCopyWith<$Res> {
  _$FoodDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? proteins = null,
    Object? carbohydrates = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      proteins: null == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as int,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodDataCopyWith<$Res> implements $FoodDataCopyWith<$Res> {
  factory _$$_FoodDataCopyWith(
          _$_FoodData value, $Res Function(_$_FoodData) then) =
      __$$_FoodDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int proteins, int carbohydrates});
}

/// @nodoc
class __$$_FoodDataCopyWithImpl<$Res>
    extends _$FoodDataCopyWithImpl<$Res, _$_FoodData>
    implements _$$_FoodDataCopyWith<$Res> {
  __$$_FoodDataCopyWithImpl(
      _$_FoodData _value, $Res Function(_$_FoodData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? proteins = null,
    Object? carbohydrates = null,
  }) {
    return _then(_$_FoodData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      proteins: null == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as int,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FoodData extends _FoodData {
  const _$_FoodData(
      {required this.name, required this.proteins, required this.carbohydrates})
      : super._();

  @override
  final String name;
  @override
  final int proteins;
  @override
  final int carbohydrates;

  @override
  String toString() {
    return 'FoodData(name: $name, proteins: $proteins, carbohydrates: $carbohydrates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.proteins, proteins) ||
                other.proteins == proteins) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, proteins, carbohydrates);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodDataCopyWith<_$_FoodData> get copyWith =>
      __$$_FoodDataCopyWithImpl<_$_FoodData>(this, _$identity);
}

abstract class _FoodData extends FoodData {
  const factory _FoodData(
      {required final String name,
      required final int proteins,
      required final int carbohydrates}) = _$_FoodData;
  const _FoodData._() : super._();

  @override
  String get name;
  @override
  int get proteins;
  @override
  int get carbohydrates;
  @override
  @JsonKey(ignore: true)
  _$$_FoodDataCopyWith<_$_FoodData> get copyWith =>
      throw _privateConstructorUsedError;
}
