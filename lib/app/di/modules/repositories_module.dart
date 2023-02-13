import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/firebase/references/references.dart';
import 'package:dietx/app/model/food/repository/food_repository.dart';
import 'package:dietx/app/model/food/repository/food_repository_impl.dart';
import 'package:dietx/app/model/settings/repository/settings_repository.dart';
import 'package:dietx/app/model/settings/repository/settings_repository_impl.dart';

import 'package:get_it/get_it.dart';

abstract class RepositoriesModule {
  static void register(GetIt locator) {
    locator.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(AppCollections.food, inject()));
    locator.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(AppDocuments.trainingConfig));
  }
}
