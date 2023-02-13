import 'dart:async';
import 'dart:io';

import 'package:dietx/app/firebase/references/reference_getter.dart';
import 'package:dietx/app/model/food/entity/food.dart';
import 'package:dietx/app/model/food/entity/food_keys.dart';
import 'package:dietx/app/model/food/repository/food_repository.dart';
import 'package:dietx/app/model/utils/files/file_manager.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class FoodRepositoryImpl implements FoodRepository {
  final PublishSubject<void> _changes = PublishSubject();

  final AppCollectionGetter<Food> _ref;
  final FileManager _fileManager;

  FoodRepositoryImpl(this._ref, this._fileManager);

  @override
  Stream<void> onChanged() => _changes.stream;

  @override
  Future<List<Food>> getFoods() async {
    final snapshot = await _ref().get();

    return snapshot.docs.map((e) => e.data().copyWith(id: e.id)).toList();
  }

  @override
  Future<Food> createFood(FoodData foodData) async {
    final String id = const Uuid().v1();
    final Food food = foodData.toBody(id);

    await _ref().doc(id).set(food);
    return food;
  }

  @override
  Future<void> updateFood(Food food) async {
    await _ref().doc(food.id).set(food);
  }

  @override
  Future<void> updateFoodImage(Food food, File imageFile) async {
    if (food.imageUrl != null) {
      await deleteFoodImage(food.imageUrl!);
    }

    final downloadUrl = await _fileManager.uploadFile(
      path: FoodKeys.imagePath,
      file: await _compressImage(imageFile),
    );
    return updateFood(food.copyWith(imageUrl: downloadUrl));
  }

  Future<File> _compressImage(File image) async {
    final tempDirectory = await getTemporaryDirectory();

    final compressedImage = await FlutterImageCompress.compressAndGetFile(
      image.path,
      tempDirectory.path + image.path.split('/').last,
      quality: 75,
    );
    return compressedImage!;
  }

  @override
  Future<void> deleteFood(Food food) async {
    await _ref().doc(food.id).delete();
    if (food.imageUrl != null) {
      await deleteFoodImage(food.imageUrl!);
    }
  }

  Future<void> deleteFoodImage(String imageUrl) async {
    String fileName = imageUrl.replaceAll('%2F', '/');
    fileName = fileName.split(FoodKeys.imagePath).last;

    if (fileName.contains('?')) {
      fileName = fileName.split('?').first;
    }

    return _fileManager.deleteFile(path: FoodKeys.imagePath + fileName);
  }
}
