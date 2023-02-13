import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/model/auth/auth_use_case.dart';
import 'package:dietx/app/model/auth/auth_use_case_impl.dart';
import 'package:dietx/app/model/food/food_use_case.dart';
import 'package:dietx/app/model/food/food_use_case_impl.dart';
import 'package:dietx/app/model/settings/settings_use_case.dart';
import 'package:dietx/app/model/settings/settings_use_case_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

abstract class UseCasesModule {
  static void register(GetIt locator) {
    locator.registerLazySingleton<AuthUseCase>(() => AuthUseCaseImpl(FirebaseAuth.instance));
    locator.registerLazySingleton<SettingsUseCase>(() => SettingsUseCaseImpl(inject()));
    locator.registerLazySingleton<FoodUseCase>(() => FoodUseCaseImpl(inject()));
  }
}
