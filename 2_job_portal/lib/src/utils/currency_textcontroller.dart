library currency_textfield;

import 'package:flutter/material.dart';
import 'dart:math';

/// A custom TextEditingController for currency input.
class CurrencyTextFieldController extends TextEditingController {
  final int _maxDigits = 11; // 999.999.999.99
  final int _numberOfDecimals;

  final String _leftSymbol;
  final String _decimalSymbol;
  final String _thousandSymbol;
  String _previewsText = "";

  double _doubleValue = 0.0;

  double get doubleValue => _doubleValue;
  String get leftSymbol => _leftSymbol;
  String get decimalSymbol => _decimalSymbol;
  String get thousandSymbol => _thousandSymbol;
  int get numberOfDecimals => _numberOfDecimals;

  CurrencyTextFieldController({
    String rightSymbol = "\$ ",
    String decimalSymbol = ".",
    String thousandSymbol = "",
    int numberOfDecimals = 2,
  })  : _leftSymbol = rightSymbol,
        _decimalSymbol = decimalSymbol,
        _thousandSymbol = thousandSymbol,
        _numberOfDecimals = numberOfDecimals {
    addListener(_listener);
  }

  _setSelectionBy({int offset}) {
    selection = TextSelection.fromPosition(TextPosition(offset: offset));
  }

  _listener() {
    if (_previewsText == text) return;
    String currencyString = text;
    currencyString = (_leftSymbol + currencyString.split(_leftSymbol).join()).toString();
    List<String> strList = currencyString.split('.');
    if (strList.length > 1 && strList[1].length > _numberOfDecimals) {
      currencyString = strList[0] + '.' + strList[1].substring(0, _numberOfDecimals);
    }
    text = currencyString;
    _previewsText = currencyString;
    _doubleValue = (text != _leftSymbol) ? double.parse(text.split(_leftSymbol).join()) : 0;
    _setSelectionBy(offset: text.length);
  }

  @override
  void dispose() {
    removeListener(_listener);
    super.dispose();
  }
}
