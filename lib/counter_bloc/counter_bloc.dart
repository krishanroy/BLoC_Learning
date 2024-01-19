import 'package:bloc_learning/counter_bloc/counter_event.dart';
import 'package:bloc_learning/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterIncrementEvent>(
      (_, emit) {
        emit(
          CounterIncrementState(state.counter + 1),
        );
      },
    );

    on<CounterDecrementEvent>(
      (_, emit) {
        emit(
          CounterDecrementState(state.counter - 1),
        );
      },
    );
  }
}
