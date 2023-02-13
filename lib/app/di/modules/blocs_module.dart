import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/pages/auth/login/login_bloc.dart';
import 'package:dietx/app/pages/auth/register/register_bloc.dart';
import 'package:dietx/app/pages/food/food_bloc.dart';
import 'package:dietx/app/pages/home/home_bloc.dart';
import 'package:dietx/app/pages/main/main_bloc.dart';
import 'package:dietx/app/pages/settings/settings_bloc.dart';
import 'package:dietx/app/pages/train_page/train_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BlocsModule {
  static void register(GetIt locator) {
    locator.registerFactory(() => LoginBloc(inject()));
    locator.registerFactory(() => RegisterBloc(inject()));
    locator.registerFactory(() => MainBloc());
    locator.registerFactory(() => HomeBloc());
    locator.registerFactory(() => TrainBloc());
    locator.registerFactory(() => FoodBloc(inject()));
    locator.registerFactory(() => SettingsBloc(inject(), inject()));
  }
}
