import 'package:dietx/app/di/di.dart';
import 'package:dietx/app/pages/train_page/train_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainPage extends StatelessWidget {
  const TrainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<TrainBloc>(),
      child: const TrainBody(),
    );
  }
}

class TrainBody extends StatefulWidget {
  const TrainBody({super.key});

  @override
  State<TrainBody> createState() => _TrainBodyState();
}

class _TrainBodyState extends State<TrainBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Placeholder(),
      ),
    );
  }
}
