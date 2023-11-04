import 'package:flutter/services.dart';

var nonDecimalInputFormatter = [
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
  FilteringTextInputFormatter.deny(RegExp('[\\-|\\ ]')),
  FilteringTextInputFormatter.digitsOnly
];


