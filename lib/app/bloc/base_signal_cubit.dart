import 'dart:async';

import 'package:dietx/app/bloc/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Callback invoked when a [signal] is emitted.
typedef BlocSignalListener<BlocSignal> = void Function(
    BuildContext context, BlocSignal signal);

/// Similar to a [BaseCubit] but offers also to send/receive signals
/// which are one time actions emitted by the cubit.
class BaseSignalCubit<BlocState, BlocSignal> extends BaseCubit<BlocState> {
  final StreamController<BlocSignal> _signals = StreamController.broadcast();

  BaseSignalCubit(super.initialState);

  Stream<BlocSignal> get signals => _signals.stream;

  void emitSignal(BlocSignal signal) {
    if (!_signals.isClosed) {
      _signals.add(signal);
    }
  }

  @override
  Future<void> close() async {
    await _signals.close();
    return super.close();
  }
}

/// Similar to a [BlocConsumer] but additionally allows to listen for signals.
class BlocSignalConsumer<Bloc extends BaseSignalCubit<BlocState, BlocSignal>,
    BlocState, BlocSignal> extends StatefulWidget {
  final BlocWidgetBuilder<BlocState> builder;
  final BlocWidgetListener<BlocState>? listener;
  final BlocBuilderCondition<BlocState>? buildWhen;
  final BlocListenerCondition<BlocState>? listenWhen;
  final BlocSignalListener<BlocSignal>? onSignal;

  const BlocSignalConsumer({
    super.key,
    required this.builder,
    this.listener,
    this.buildWhen,
    this.listenWhen,
    this.onSignal,
  });

  @override
  State<BlocSignalConsumer<Bloc, BlocState, BlocSignal>> createState() {
    return _BlocSignalConsumerState<Bloc, BlocState, BlocSignal>();
  }
}

class _BlocSignalConsumerState<
        Bloc extends BaseSignalCubit<BlocState, BlocSignal>,
        BlocState,
        BlocSignal>
    extends State<BlocSignalConsumer<Bloc, BlocState, BlocSignal>>
    with
        BlocSignalMixin<Bloc, BlocSignal,
            BlocSignalConsumer<Bloc, BlocState, BlocSignal>> {
  @override
  void onSignal(BuildContext context, BlocSignal signal) {
    widget.onSignal?.call(context, signal);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Bloc, BlocState>(
      builder: widget.builder,
      listener: widget.listener ?? (context, state) {},
      buildWhen: widget.buildWhen,
      listenWhen: widget.listenWhen,
    );
  }
}

/// Allows to subscribe for signals without creating a dedicated widget for that.
///
/// The mixin will deliver signal through [onSignal] which must be overriden.
mixin BlocSignalMixin<Bloc extends BaseSignalCubit<dynamic, BlocSignal>,
    BlocSignal, T extends StatefulWidget> on State<T> {
  StreamSubscription<BlocSignal>? _subscription;
  Bloc? _previousBloc;

  /// Override this method to provide a custom implementation for handling signals.
  void onSignal(BuildContext context, BlocSignal signal);

  @override
  void initState() {
    super.initState();

    final Bloc bloc = BlocProvider.of(context);
    _init(bloc);
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);

    final Bloc bloc = BlocProvider.of(context);
    if (bloc != _previousBloc) {
      _dispose();
      _init(bloc);
    }
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _init(Bloc bloc) {
    _previousBloc = bloc;
    _subscription = bloc.signals.listen((signal) {
      if (mounted) {
        onSignal(context, signal);
      }
    });
  }

  void _dispose() {
    _subscription?.cancel();
    _subscription = null;
    _previousBloc = null;
  }
}
