import 'package:auto_route/auto_route.dart';
import 'package:dietx/app/pages/auth/login/login_page.dart';
import 'package:dietx/app/pages/auth/register/register_page.dart';
import 'package:dietx/app/pages/food/food_page.dart';
import 'package:dietx/app/pages/home/home_page.dart';
import 'package:dietx/app/pages/main/main_page.dart';
import 'package:dietx/app/pages/settings/settings_page.dart';
import 'package:dietx/app/pages/splash/splash_page.dart';
import 'package:dietx/app/pages/train_page/train_page.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(path: 'splash', page: SplashPage, initial: true),
  AutoRoute(path: '/login', page: LoginPage),
  AutoRoute(path: '/register', page: RegisterPage, fullscreenDialog: true),
  AutoRoute(path: '/main', page: MainPage, children: [
    AutoRoute(path: 'home', page: HomePage),
    AutoRoute(path: 'train', page: TrainPage),
    AutoRoute(path: 'food', page: FoodPage),
    AutoRoute(path: 'settings', page: SettingsPage)
  ]),
])
class AppRouter extends _$AppRouter {}
