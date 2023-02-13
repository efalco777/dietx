import 'dart:async';

import 'package:dietx/app/app.dart';
import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/model/auth/auth_status.dart';
import 'package:dietx/app/model/auth/auth_use_case.dart';
import 'package:dietx/app/router/router.dart';
import 'package:flutter/material.dart';

class AppStateManager extends StatefulWidget {
  final Widget child;

  const AppStateManager({super.key, required this.child});

  @override
  State<AppStateManager> createState() => _AppStateManagerState();
}

class _AppStateManagerState extends State<AppStateManager> {
  final AuthUseCase _authUseCase = inject<AuthUseCase>();
  late final StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription = _authUseCase.onAuthChanged().listen(onAuthChanged);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void onAuthChanged(AuthStatus authStatus) {
    switch (authStatus) {
      case AuthStatus.loggedIn:
        rootRouter.popAndPushAll([const MainRoute()]);
        break;
      case AuthStatus.loggedOut:
        rootRouter.popAndPushAll([const LoginRoute()]);
        break;
    }
  }
}
