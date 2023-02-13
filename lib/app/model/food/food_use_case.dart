import 'dart:io';

import 'package:dietx/app/model/food/entity/food.dart';

abstract class FoodUseCase {
  Stream<void> onChanged();
  Future<List<Food>> getFoods();
  Future<Food> createFood(FoodData foodData);
  Future<void> updateFood(Food food);
  Future<void> uploadFoodImage(Food food, File file);
  Future<void> deleteFood(Food food);
}
