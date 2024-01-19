import 'package:flutter/material.dart';

abstract class ColorState {
  Color color = Colors.purple;

  ColorState({required this.color});
}

class ColorInitialState extends ColorState {
  ColorInitialState() : super(color: Colors.purple);
}

class ColorIncrementState extends ColorState {
  ColorIncrementState(Color increasedColor) : super(color: increasedColor);
}

class ColorDecrementState extends ColorState {
  ColorDecrementState(Color decreasedColor) : super(color: decreasedColor);
}
