import 'dart:async';
import 'dart:io';

import 'package:dietx/app/bloc/base_cubit.dart';
import 'package:dietx/app/model/food/entity/food.dart';
import 'package:dietx/app/model/food/food_use_case.dart';
import 'package:dietx/app/pages/food/food_state.dart';

class FoodBloc extends BaseCubit<FoodState> {
  final FoodUseCase _useCase;

  FoodBloc(this._useCase)
      : super(
          const FoodState(
            foods: [],
            content: FoodContent.loading(),
            isUpdating: false,
          ),
        );

  Future<void> refresh({bool silent = false}) async {
    if (silent) {
      emit(state.copyWith(isUpdating: true));
    } else {
      emit(state.copyWith(content: const FoodContent.loading()));
    }
    try {
      final foods = await _useCase.getFoods();
      emit(state.copyWith(
        content: foods.isEmpty ? const FoodContent.empty() : const FoodContent.loaded(),
        foods: foods,
        isUpdating: false,
      ));
    } catch (e) {
      emit(
        state.copyWith(content: const FoodContent.error(), isUpdating: false),
      );
    }
  }

  Future<void> updateFood(Food food) async {
    emit(state.copyWith(isUpdating: true));
    try {
      await _useCase.updateFood(food);
      refresh(silent: true);
    } catch (e) {
      emit(state.copyWith(content: const FoodContent.error()));
    }
  }

  Future<void> uploadFoodImage(Food food, File imageFile) async {
    emit(state.copyWith(isUpdating: true));
    try {
      await _useCase.uploadFoodImage(food, imageFile);
      refresh(silent: true);
    } catch (e) {
      emit(state.copyWith(content: const FoodContent.error()));
    }
  }

  Future<void> createFood(FoodData food, File? imageFile) async {
    emit(state.copyWith(isUpdating: true));
    try {
      final newFood = await _useCase.createFood(food);
      if (imageFile != null) await uploadFoodImage(newFood, imageFile);
      refresh(silent: true);
    } catch (e) {
      emit(state.copyWith(
        isUpdating: false,
        content: const FoodContent.error(),
      ));
    }
  }

  Future<void> deleteFood(Food food) async {
    emit(state.copyWith(isUpdating: true));
    try {
      await _useCase.deleteFood(food);
      refresh(silent: true);
    } catch (e) {
      emit(
        state.copyWith(
          content: const FoodContent.error(),
          isUpdating: false,
        ),
      );
    }
  }
}
