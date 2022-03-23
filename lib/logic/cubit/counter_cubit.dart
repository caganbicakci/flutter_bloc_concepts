import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_concepts/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0)) {
    // monitorInternetCubit();
  }

  // monitorInternetCubit() {
  //   internetStramSubscription = internetCubit.stream.listen((internetState) {
  //     if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Wifi) {
  //       increment();
  //     } else if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Mobile) {
  //       decrement();
  //     }
  //   });
  // }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}