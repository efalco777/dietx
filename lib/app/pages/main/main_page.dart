import 'package:auto_route/auto_route.dart';
import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/pages/main/main_bloc.dart';
import 'package:dietx/app/router/router.dart';
import 'package:dietx/app/theming/app_colors.dart';
import 'package:dietx/app/theming/dimens.dart';
import 'package:dietx/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './widgets.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<MainBloc>(),
      child: const MainBody(),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final List<_AppTabData> _tabs = [
    _AppTabData(
      name: LocaleKeys.pages_main_home_tab_name.tr(),
      icon: Icons.home,
      route: const HomeRoute(),
    ),
    _AppTabData(
      name: LocaleKeys.pages_main_train_tab_name.tr(),
      icon: Icons.accessibility,
      route: const TrainRoute(),
    ),
    _AppTabData(
      name: LocaleKeys.pages_main_food_tab_name.tr(),
      icon: Icons.local_restaurant_outlined,
      route: const FoodRoute(),
    ),
    _AppTabData(
      name: LocaleKeys.pages_main_settings_tab_name.tr(),
      icon: Icons.settings,
      route: const SettingsRoute(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: _tabs.map((e) => e.route).toList(),
      builder: (context, child, animation) {
        return SafeArea(
          child: ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _BottomNavigationBar(
                    tabs: _tabs,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
