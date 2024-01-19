import 'package:bloc_learning/color_bloc/color_state.dart';
import 'package:bloc_learning/counter_bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorBloc extends Bloc<CounterEvent, ColorState> {
  ColorBloc() : super(ColorInitialState()) {
    on<CounterIncrementEvent>(
      (_, emit) {
        emit(
          ColorIncrementState(Colors.green),
        );
      },
    );

    on<CounterDecrementEvent>(
      (_, emit) {
        emit(
          ColorDecrementState(Colors.amber),
        );
      },
    );
  }
}
