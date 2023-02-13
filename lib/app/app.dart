import 'package:dietx/app/router/router.dart';
import 'package:dietx/app/theming/app_theme.dart';
import 'package:dietx/app/widgets/app_state_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final AppRouter rootRouter = AppRouter();

class DietXApp extends StatelessWidget {
  const DietXApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppStateManager(
      child: MaterialApp.router(
        routerDelegate: rootRouter.delegate(),
        builder: (context, child) => child ?? const SizedBox.shrink(),
        routeInformationParser: rootRouter.defaultRouteParser(),
        localizationsDelegates: [
          ...context.localizationDelegates,
        ],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
