import 'package:dietx/app/pages/main/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Cubit<MainState> {
  MainBloc()
      : super(
          const MainState(
            content: MainContent.loaded(),
            selectedTabIndex: 0,
          ),
        );
}
