library keicy_network_image;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_cupertino_indicator.dart';

@immutable
class CustomNetworkImage extends StatefulWidget {
  CustomNetworkImage({
    Key key,
    @required this.url,
    @required this.width,
    @required this.height,
    this.boxFit = BoxFit.cover,
    this.errorTextColor = Colors.blue,
    this.errorTextFontSize = 15.0,
    this.borderColor = Colors.white,
    this.borderWidth = 0,
    this.borderRadius = 0.0,
    this.brightness = Brightness.light,
    this.loadingWidget,
    this.errorWidget,
    this.color,
    this.colorBlendMode,
    this.indicatorSize,
  }) : super(key: key);
  final String url;
  final double width;
  final double height;
  final Color errorTextColor;
  final BoxFit boxFit;
  final double errorTextFontSize;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Brightness brightness;
  final Widget loadingWidget;
  final Widget errorWidget;
  final Color color;
  final BlendMode colorBlendMode;
  double indicatorSize;

  @override
  _CustomNetworkImageState createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  @override
  Widget build(BuildContext context) {
    if (widget.indicatorSize == null)
      widget.indicatorSize = (widget.height != null) ? widget.height / 5 : (widget.width != null) ? widget.width / 5 : 20;
    try {
      if (widget.url != "" && widget.url != null) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            border: Border.all(color: widget.borderColor, width: widget.borderWidth),
            borderRadius: BorderRadius.circular(double.parse(widget.borderRadius.toString())),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(double.parse(widget.borderRadius.toString())),
            child: Image.network(
              widget.url,
              width: widget.width,
              height: widget.height,
              fit: widget.boxFit,
              color: widget.color,
              colorBlendMode: widget.colorBlendMode,
              filterQuality: FilterQuality.low,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return widget.loadingWidget ??
                    Container(
                      width: widget.width,
                      height: widget.height,
                      child: Center(
                        child: CustomCupertinoIndicator(
                          size: widget.indicatorSize,
                          brightness: widget.brightness,
                        ),
                      ),
                    );
              },
              errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                return widget.errorWidget ??
                    Container(
                      width: widget.width,
                      height: widget.height,
                      child: Center(
                        child: Icon(
                          Icons.not_interested,
                          size: widget.indicatorSize,
                          color: widget.errorTextColor,
                        ),
                      ),
                    );
              },
            ),
          ),
        );
      } else {
        return widget.errorWidget ??
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                border: Border.all(color: widget.borderColor, width: widget.borderWidth),
                borderRadius: BorderRadius.circular(double.parse(widget.borderRadius.toString())),
              ),
              child: Center(
                child: Icon(
                  Icons.not_interested,
                  size: widget.indicatorSize,
                  color: widget.errorTextColor,
                ),
              ),
            );
      }
    } catch (e) {
      return widget.errorWidget ??
          Container(
            width: widget.width,
            height: widget.height,
            child: Center(
              child: Icon(
                Icons.not_interested,
                size: widget.indicatorSize,
                color: widget.errorTextColor,
              ),
            ),
          );
    }
  }
}
