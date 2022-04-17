import 'dart:math';
import 'package:flutter/material.dart';

// Will be used for the purposes of mock data
var colorStrings = ["blue", "black", "green", "yellow", "red", "purple"];
var colors = [
  Colors.blue,
  Colors.black,
  Colors.green,
  Colors.yellow,
  Colors.red,
  Colors.purple
];

var colorStringsToColors = {
  'blue': Colors.blue,
  'black': Colors.black,
  'green': Colors.green,
  'yellow': Colors.yellow,
  'red': Colors.red,
  'purple': Colors.purple,
};

String getRandColorString() {
  var rnd = new Random();
  int r = rnd.nextInt(colorStrings.length - 1);
  return colorStrings[r];
}

Color getRandColor() {
  var rnd = new Random();
  int r = rnd.nextInt(colorStrings.length - 1);
  return colors[r];
}
