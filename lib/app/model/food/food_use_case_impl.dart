import 'dart:io';

import 'package:dietx/app/model/food/entity/food.dart';
import 'package:dietx/app/model/food/food_use_case.dart';
import 'package:dietx/app/model/food/repository/food_repository.dart';

class FoodUseCaseImpl implements FoodUseCase {
  final FoodRepository repository;

  FoodUseCaseImpl(this.repository);

  @override
  Stream<void> onChanged() => repository.onChanged();

  @override
  Future<Food> createFood(FoodData foodData) async {
    return repository.createFood(foodData);
  }

  @override
  Future<List<Food>> getFoods() {
    return repository.getFoods();
  }

  @override
  Future<void> updateFood(Food food) {
    return repository.updateFood(food);
  }

  @override
  Future<void> uploadFoodImage(Food food, File file) {
    return repository.updateFoodImage(food, file);
  }

@override
  Future<void> deleteFood(Food food){
    return repository.deleteFood(food);
  }
}
