import 'dart:io';

import 'package:dietx/app/model/food/entity/food.dart';

abstract class FoodRepository {
  Stream<void> onChanged();
  Future<List<Food>> getFoods();
  Future<Food> createFood(FoodData foodData);
  Future<void> updateFood(Food food);
  Future<void> updateFoodImage(Food food, File image);
  Future<void> deleteFood(Food food);
}
