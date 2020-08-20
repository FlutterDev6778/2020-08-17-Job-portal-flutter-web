import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoundItemGroup extends StatelessWidget {
  RoundItemGroup({
    @required this.data,
    @required this.spacing,
    @required this.runSpacing,
    @required this.fontSize,
    @required this.itemHeight,
    @required this.textColor,
    @required this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
  });

  List<String> data;
  double spacing;
  double runSpacing;
  double fontSize;
  double itemHeight;
  Color textColor;
  Color backgroundColor;
  double borderWidth;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: data.map((String item) {
        return Container(
          width: item.length * fontSize * 0.7,
          height: itemHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: borderWidth, color: borderColor),
            borderRadius: BorderRadius.circular(itemHeight / 2),
            color: Colors.white,
          ),
          child: Text(
            item,
            style: TextStyle(fontSize: fontSize, color: textColor),
          ),
        );
      }).toList(),
    );
  }
}
