import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key key,
    this.initialValue,
    @required this.width,
    @required this.height,
    this.fixedHeightState = false,
    this.textAlign = TextAlign.left,
    this.keyboardType = TextInputType.text,
    this.textColor = Colors.black,
    this.textFontSize = 20,
    this.hintText = "",
    this.focusNode,
    this.hintTextFontSize,
    this.hintTextColor = Colors.grey,
    this.borderRadius = 4.0,
    this.validatorHandler,
    this.onSaveHandler,
    this.borderType = 1, // 1: UnderlineInputBorder 2: OutlineInputBorder
    this.contentHorizontalPadding = 5,
    this.contentVerticalPadding = 5,
    this.prefixIcon,
    this.suffixIcon,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
    this.enableBorderColor,
    this.focusBorderColor,
    this.errorBoarderColor = Colors.red,
    this.disabledBorderColor = const Color(0x33ffffff),
    this.fillColor = Colors.white,
    this.autovalidate = false,
    this.obscureText = false,
    this.autofocus = false,
    this.controller,
    this.onChangeHandler,
    this.onTapHandler,
    this.onFieldSubmittedHandler,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.none,
    this.readOnly = false,
    this.errorStringFontSize,
    this.inputFormatters,
  }) : super(key: key);
  final String initialValue;
  double errorStringFontSize;
  final focusNode;
  final bool fixedHeightState;
  final double width;
  final double height;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final Color textColor;
  final double textFontSize;
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Color fillColor;
  final bool autovalidate;
  final bool obscureText;
  final double borderRadius;
  final Function validatorHandler;
  final Function onSaveHandler;
  final int borderType;
  final double contentHorizontalPadding;
  final double contentVerticalPadding;
  final double borderWidth;
  final Color borderColor;
  final TextEditingController controller;
  final Function onChangeHandler;
  final Function onTapHandler;
  final Function onFieldSubmittedHandler;
  final bool autofocus;
  final int maxLines;
  final TextInputAction textInputAction;
  final bool readOnly;
  final inputFormatters;
  Color focusBorderColor;
  Color enableBorderColor;
  Color errorBoarderColor;
  Color disabledBorderColor;
  double hintTextFontSize;
  Color hintTextColor;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    widget.hintTextFontSize = widget.hintTextFontSize ?? widget.textFontSize;
    widget.hintTextColor = widget.hintTextColor ?? widget.textColor;
    widget.focusBorderColor = widget.focusBorderColor ?? widget.borderColor;
    widget.enableBorderColor = widget.enableBorderColor ?? widget.borderColor;
    if (widget.errorStringFontSize == null) widget.errorStringFontSize = widget.textFontSize * 0.8;

    BorderSide borderside = BorderSide(width: widget.borderWidth, color: widget.borderColor);
    BorderSide errorBorderside = BorderSide(width: widget.borderWidth, color: widget.errorBoarderColor);
    BorderSide hideBorderSide = BorderSide(width: 0, color: widget.fillColor);

    return Material(
      color: Colors.transparent,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CustomTextFormFieldProvider()),
        ],
        child: Consumer<CustomTextFormFieldProvider>(
          builder: (context, customTextFormFieldProvider, _) {
            return Container(
              width: widget.width,
              height: widget.height + ((widget.fixedHeightState) ? (widget.errorStringFontSize + 5) : 0),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: widget.width,
                    height: widget.height,
                    padding: EdgeInsets.all(1),
                    alignment: (widget.keyboardType == TextInputType.multiline) ? Alignment.topLeft : Alignment.center,
                    decoration: (widget.borderType == 1)
                        ? BoxDecoration(
                            color: widget.fillColor,
                            border: Border(bottom: (customTextFormFieldProvider.errorState) ? errorBorderside : borderside),
                          )
                        : BoxDecoration(
                            color: widget.fillColor,
                            border: (customTextFormFieldProvider.errorState)
                                ? Border.all(width: widget.borderWidth, color: widget.errorBoarderColor)
                                : Border.all(width: widget.borderWidth, color: widget.borderColor),
                            borderRadius: BorderRadius.circular(widget.borderRadius),
                          ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        (widget.prefixIcon != null)
                            ? Container(padding: EdgeInsets.only(left: 0), color: widget.fillColor, child: widget.prefixIcon)
                            : SizedBox(),
                        Expanded(
                          child: TextFormField(
                            focusNode: widget.focusNode,
                            maxLines: widget.maxLines,
                            textInputAction: widget.textInputAction,
                            autofocus: widget.autofocus,
                            initialValue: widget.initialValue,
                            readOnly: widget.readOnly,
                            textAlign: widget.textAlign,
                            style: TextStyle(color: widget.textColor, fontSize: widget.textFontSize),
                            keyboardType: widget.keyboardType,
                            autovalidate: widget.autovalidate,
                            controller: widget.controller,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 0, color: widget.fillColor),
                              isDense: true,
                              hintText: widget.hintText,
                              // prefixIcon: prefixIcon,
                              // suffixIcon: suffixIcon,
                              hintStyle: TextStyle(fontSize: widget.hintTextFontSize, color: widget.hintTextColor),
                              border: UnderlineInputBorder(borderSide: hideBorderSide),
                              enabledBorder: UnderlineInputBorder(borderSide: hideBorderSide),
                              focusedBorder: UnderlineInputBorder(borderSide: hideBorderSide),
                              focusedErrorBorder: UnderlineInputBorder(borderSide: hideBorderSide),
                              errorBorder: UnderlineInputBorder(borderSide: hideBorderSide),
                              disabledBorder: UnderlineInputBorder(borderSide: hideBorderSide),
                              filled: true,
                              fillColor: widget.fillColor,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: widget.contentHorizontalPadding, vertical: widget.contentVerticalPadding),
                              // contentPadding: EdgeInsets.symmetric(
                              //     horizontal: contentPadding, vertical: (keyboardType == TextInputType.multiline) ? contentPadding : 0),
                            ),
                            inputFormatters: widget.inputFormatters,
                            obscureText: widget.obscureText,
                            onTap: widget.onTapHandler,
                            onChanged: (input) {
                              customTextFormFieldProvider.setErrorState(false, "");
                              if (widget.onChangeHandler != null) widget.onChangeHandler(input);
                            },
                            validator: (input) {
                              if (widget.validatorHandler == null) return null;
                              var result = widget.validatorHandler(input);
                              if (result != null)
                                customTextFormFieldProvider.setErrorState(true, result);
                              else
                                customTextFormFieldProvider.setErrorState(false, "");
                              return result;
                            },
                            onSaved: (input) {
                              if (widget.onSaveHandler == null) return null;
                              widget.onSaveHandler(input.trim());
                            },
                            onFieldSubmitted: widget.onFieldSubmittedHandler,
                          ),
                        ),
                        (widget.suffixIcon != null)
                            ? Container(padding: EdgeInsets.only(right: 0), color: widget.fillColor, child: widget.suffixIcon)
                            : SizedBox(),
                      ],
                    ),
                  ),
                  (customTextFormFieldProvider.errorState)
                      ? Container(
                          height: widget.errorStringFontSize + 5,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            customTextFormFieldProvider.validatorText,
                            style: TextStyle(fontSize: widget.errorStringFontSize, color: Colors.red),
                          ),
                        )
                      : (widget.fixedHeightState) ? SizedBox(height: widget.errorStringFontSize) : SizedBox(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomTextFormFieldProvider extends ChangeNotifier {
  static CustomTextFormFieldProvider of(BuildContext context, {bool listen = false}) =>
      Provider.of<CustomTextFormFieldProvider>(context, listen: listen);

  bool _errorState = false;
  String _validatorText = "";

  bool get errorState => _errorState;
  String get validatorText => _validatorText;

  void setErrorState(bool errorState, String validatorText) {
    if (_errorState != errorState) {
      _errorState = errorState;
      _validatorText = validatorText;
      notifyListeners();
    }
  }
}
