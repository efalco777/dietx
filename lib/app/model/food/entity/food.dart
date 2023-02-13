import 'package:dietx/app/model/food/entity/food_keys.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@freezed
class Food with _$Food {
  static const Food empty = Food(
    id: '',
    name: '',
    imageUrl: '',
    proteins: 0,
    carbohydrates: 0,
  );

  const factory Food({
    @JsonKey(name: FoodKeys.id) required String id,
    @JsonKey(name: FoodKeys.name) required String name,
    @JsonKey(name: FoodKeys.imageUrl) required String? imageUrl,
    @JsonKey(name: FoodKeys.proteins) required int proteins,
    @JsonKey(name: FoodKeys.carbohydrates) required int carbohydrates,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
}

@freezed
class FoodData with _$FoodData {
  const FoodData._();
  const factory FoodData({
    required String name,
    required int proteins,
    required int carbohydrates,
  }) = _FoodData;

  Food toBody(String uuid) {
    return Food(
      id: uuid,
      name: name,
      imageUrl: null,
      proteins: proteins,
      carbohydrates: carbohydrates,
    );
  }
}
