import 'dart:io';

import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/model/food/entity/food.dart';
import 'package:dietx/app/pages/food/food_bloc.dart';
import 'package:dietx/app/pages/food/food_state.dart';
import 'package:dietx/app/theming/dimens.dart';
import 'package:dietx/app/widgets/app_slider.dart';
import 'package:dietx/app/widgets/app_text_field.dart';
import 'package:dietx/app/widgets/common/spacing.dart';
import 'package:dietx/app/widgets/content/error_content.dart';
import 'package:dietx/app/widgets/content/loading_content.dart';
import 'package:dietx/app/widgets/content/updatable_content.dart';
import 'package:dietx/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'widgets.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<FoodBloc>()..refresh(silent: false),
      child: const _FoodBody(),
    );
  }
}

class _FoodBody extends StatelessWidget {
  const _FoodBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocSelector<FoodBloc, FoodState, FoodContent>(
        selector: (state) => state.content,
        builder: (context, content) {
          return content.when(
            loading: () => const LoadingContent(),
            loaded: () => const _Loaded(),
            empty: () => const _Empty(),
            error: () => ErrorContent(onRefresh: BlocProvider.of<FoodBloc>(context).refresh),
          );
        },
      ),
    );
  }
}

class _Loaded extends StatelessWidget {
  const _Loaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FoodBloc bloc = BlocProvider.of(context);

    return BlocSelector<FoodBloc, FoodState, bool>(
      selector: (state) => state.isUpdating,
      builder: (context, isUpdating) {
        return BlocSelector<FoodBloc, FoodState, List<Food>>(
          selector: (state) => state.foods,
          builder: (context, foods) {
            final int totalCount = foods.length + 1;
            return UpdatableContent(
              isUpdating: isUpdating,
              child: LayoutBuilder(builder: (context, constraints) {
                return ListView.separated(
                  itemCount: totalCount,
                  padding: Insets.normal,
                  itemBuilder: (context, index) {
                    if (index == totalCount - 1) {
                      return ElevatedButton(
                        onPressed: () async {
                          final result = await _showFoodBottomSheet(context: context, food: null);
                          if (result != null) {
                            await bloc.createFood(result.foodData, result.imageFile);
                          }
                        },
                        child: const Text('+'),
                      );
                    }

                    return _FoodItem(
                      food: foods[index],
                      maxWidth: constraints.maxWidth,
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(color: Colors.white),
                );
              }),
            );
          },
        );
      },
    );
  }
}

class _Empty extends StatefulWidget {
  const _Empty({Key? key}) : super(key: key);

  @override
  State<_Empty> createState() => _EmptyState();
}

class _EmptyState extends State<_Empty> {
  @override
  Widget build(BuildContext context) {
    final FoodBloc bloc = BlocProvider.of(context);

    return BlocSelector<FoodBloc, FoodState, bool>(
        selector: (state) => state.isUpdating,
        builder: (context, isUpdating) {
          return UpdatableContent(
            isUpdating: isUpdating,
            child: Padding(
              padding: Insets.normal,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.restaurant,
                      size: 56,
                    ),
                    Spacing.normal,
                    Text(
                      LocaleKeys.pages_food_empty_content_description.tr(),
                      textAlign: TextAlign.center,
                    ),
                    Spacing.small,
                    ElevatedButton(
                      onPressed: () async {
                        final result = await _showFoodBottomSheet(context: context, food: null);
                        if (result != null) {
                          await bloc.createFood(result.foodData, result.imageFile);
                        }
                      },
                      child: const Text('+'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
