import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class CustomRaisedButton extends StatefulWidget {
  CustomRaisedButton({
    Key key,
    @required this.child,
    this.color,
    this.textColor,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 4.0,
    this.loading = false,
    this.brightness = Brightness.dark,
    this.progressIndicatorSize,
    this.onPressed,
    this.elevation = 5,
    this.borderWidth = 0,
    this.borderColor = Colors.white,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final bool loading;
  final Brightness brightness;
  double progressIndicatorSize;
  final VoidCallback onPressed;
  final double elevation;
  final double borderWidth;
  final Color borderColor;

  @override
  _CustomRaisedButtonState createState() => _CustomRaisedButtonState();
}

class _CustomRaisedButtonState extends State<CustomRaisedButton> {
  Widget buildSpinner(BuildContext context) {
    if (widget.progressIndicatorSize == null) widget.progressIndicatorSize = widget.height / 2;
    final ThemeData data = Theme.of(context);
    return CupertinoTheme(
      data: CupertinoTheme.of(context).copyWith(brightness: widget.brightness),
      child: SizedBox(
        width: widget.progressIndicatorSize,
        height: widget.progressIndicatorSize,
        child: CupertinoActivityIndicator(
          radius: widget.progressIndicatorSize / 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(width: widget.borderWidth, color: widget.borderColor),
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius + 2),
        ),
      ),
      child: RaisedButton(
        elevation: widget.elevation,
        child: widget.loading ? buildSpinner(context) : widget.child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
        ),
        color: widget.color,
        disabledColor: widget.color,
        textColor: widget.textColor,
        onPressed: widget.onPressed,
      ),
    );
  }
}
