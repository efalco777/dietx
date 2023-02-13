import 'package:dietx/app/app.dart';
import 'package:dietx/app/bloc/base_signal_cubit.dart';
import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/pages/auth/register/register_bloc.dart';
import 'package:dietx/app/pages/auth/register/register_state.dart';
import 'package:dietx/app/theming/dimens.dart';
import 'package:dietx/app/widgets/app_text_field.dart';
import 'package:dietx/app/widgets/common/spacing.dart';
import 'package:dietx/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<RegisterBloc>(),
      child: const RegisterBody(),
    );
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> with BlocSignalMixin<RegisterBloc, RegisterSignal, RegisterBody> {
  @override
  Widget build(BuildContext context) {
    final RegisterBloc bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: Insets.normal,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.pages_registration_page_title.tr()),
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
                      ElevatedButton(
                        onPressed: bloc.onRegister,
                        child: Text(LocaleKeys.pages_registration_register_button_label.tr()),
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
    signal.when(
      registrationComplete: () => rootRouter.pop(),
      error: (message) {},
    );
  }
}
