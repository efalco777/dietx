import 'package:dietx/app/model/food/entity/food.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_state.freezed.dart';

@freezed
class FoodState with _$FoodState {
  const factory FoodState({
    required FoodContent content,
    required List<Food> foods,
    required bool isUpdating
  }) = _FoodState;
}

@freezed
class FoodContent with _$FoodContent {
  const factory FoodContent.loading() = _Loading;
  const factory FoodContent.loaded() = _Loaded;
  const factory FoodContent.empty() = _Empty;
  const factory FoodContent.error() = _Error;
}
