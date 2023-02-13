import 'package:dietx/app/app.dart';
import 'package:dietx/app/bloc/base_signal_cubit.dart';
import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/pages/auth/login/login_bloc.dart';
import 'package:dietx/app/pages/auth/login/login_state.dart';
import 'package:dietx/app/router/router.dart';
import 'package:dietx/app/theming/dimens.dart';
import 'package:dietx/app/widgets/app_text_field.dart';
import 'package:dietx/app/widgets/common/spacing.dart';
import 'package:dietx/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<LoginBloc>(),
      child: const LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> with BlocSignalMixin<LoginBloc, LoginSignal, LoginBody> {
  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of(context);
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: Insets.normal,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.pages_login_page_title.tr()),
                      Spacing.small,
                      AppTextField(
                        labelText: LocaleKeys.pages_login_email.tr(),
                        onChanged: bloc.onEditEmail,
                      ),
                      Spacing.small,
                      AppTextField(
                        labelText: LocaleKeys.pages_login_password.tr(),
                        onChanged: bloc.onEditPassword,
                      ),
                      Spacing.normal,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () => rootRouter.push(
                              const RegisterRoute(),
                            ),
                            child: Text(LocaleKeys.pages_login_register_button_label.tr()),
                          ),
                          ElevatedButton(
                            onPressed: bloc.onLogin,
                            child: Text(LocaleKeys.pages_login_login_button_label.tr()),
                          )
                        ],
                      )
                    ],
                  ),
                  if (state.isLoading)
                    Positioned.fill(
                      child: Container(
                        color: Theme.of(context).shadowColor.withOpacity(0.5),
                      ),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void onSignal(BuildContext context, signal) {
    // TODO show toasts here
    signal.map(
      loggedIn: (_) {},
      error: (e) {},
    );
  }
}
