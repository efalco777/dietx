import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/model/settings/entity/training_config.dart';
import 'package:dietx/app/pages/settings/settings_bloc.dart';
import 'package:dietx/app/pages/settings/settings_state.dart';
import 'package:dietx/app/theming/dimens.dart';
import 'package:dietx/app/widgets/app_radio_group.dart';
import 'package:dietx/app/widgets/app_slider.dart';
import 'package:dietx/app/widgets/common/spacing.dart';
import 'package:dietx/app/widgets/content/error_content.dart';
import 'package:dietx/app/widgets/content/loading_content.dart';
import 'package:dietx/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<SettingsBloc>()..refresh(),
      child: const SettingsBody(),
    );
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocSelector<SettingsBloc, SettingsState, SettingsContent>(
        selector: (state) => state.content,
        builder: (context, content) {
          return content.when(
            loading: () => const LoadingContent(),
            loaded: () => const _LoadedContent(),
            error: () => ErrorContent(onRefresh: BlocProvider.of<SettingsBloc>(context).refresh),
          );
        },
      ),
    );
  }
}

class _LoadedContent extends StatelessWidget {
  const _LoadedContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsBloc bloc = BlocProvider.of(context);
    return Padding(
      padding: Insets.normal,
      child: Column(
        children: [
          _SectionHeader(title: LocaleKeys.common_weight_kg.tr()),
          Spacing.tiny,
          BlocSelector<SettingsBloc, SettingsState, int>(
            selector: (state) => state.trainingConfig.weight,
            builder: (context, weight) {
              return AppSlider(
                value: weight,
                minValue: TrainingConfig.minWeight,
                maxValue: TrainingConfig.maxWeight,
                onValueChanged: bloc.onWeightChanged,
              );
            },
          ),
          Spacing.normal,
          _SectionHeader(title: LocaleKeys.common_meals_per_day.tr()),
          Spacing.tiny,
          BlocSelector<SettingsBloc, SettingsState, int>(
            selector: (state) => state.trainingConfig.mealsPerDay,
            builder: (context, weight) {
              return AppSlider(
                value: weight,
                minValue: TrainingConfig.minMealsPerDay,
                maxValue: TrainingConfig.maxMealsPerDay,
                onValueChanged: bloc.onMealsPerDayChanged,
              );
            },
          ),
          Spacing.normal,
          _SectionHeader(title: LocaleKeys.pages_settings_training_type_label.tr()),
          Spacing.tiny,
          BlocSelector<SettingsBloc, SettingsState, TrainingType>(
            selector: (state) => state.trainingConfig.trainingType,
            builder: (context, trainingType) {
              return AppRadioGroup(
                items: TrainingType.values.map((e) => AppRadioGroupData(value: e, label: e.name)).toList(),
                value: trainingType,
                onValueChanged: bloc.onTrainingTypeChanged,
              );
            },
          ),
          const Divider(),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: bloc.submitChanges,
              child: Text(LocaleKeys.pages_settings_save_button_label.tr()),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: bloc.onLogout,
              style: Theme.of(context)
                  .elevatedButtonTheme
                  .style
                  ?.copyWith(backgroundColor: MaterialStateProperty.all(Theme.of(context).errorColor)),
              child: Text(LocaleKeys.pages_settings_logout_button_label.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
