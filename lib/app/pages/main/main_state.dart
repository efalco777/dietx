import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required MainContent content,
    required int selectedTabIndex,
  }) = _MainState;
}

@freezed
class MainContent with _$MainContent {
  const factory MainContent.loading() = _Loading;
  const factory MainContent.loaded() = _Loaded;
  const factory MainContent.error() = _Error;
}
