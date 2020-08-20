import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key key,
    @required this.menuItems,
    @required this.width,
    @required this.height,
    this.hintText = "",
    this.itemTextStyle,
    this.hintTextStyle,
    this.selectedItemTextStyle,
    this.icon,
    this.disabled = false,
    this.iconSize = 10,
    this.borderType = 2,
    this.borderRadius = 0,
    this.borderColor = Colors.black,
    this.borderWidth = 1,
    this.padding = 5,
    this.onChangeHandler,
    this.value,
    this.fillColor = Colors.white,
    this.dropdownColor = Colors.white,
    this.isExpanded = true,
  }) : super(key: key);
  final List<Map<String, dynamic>> menuItems;
  final double width;
  final double height;
  final String hintText;
  final int borderType;
  final double borderRadius;
  final double iconSize;
  final Color borderColor;
  final bool disabled;
  final double borderWidth;
  final double padding;
  final Function onChangeHandler;
  final dynamic value;
  final Color fillColor;
  final Color dropdownColor;
  final bool isExpanded;
  TextStyle itemTextStyle;
  TextStyle selectedItemTextStyle;
  TextStyle hintTextStyle;
  Icon icon;

  init(CustomDropDownProvider customDropDownProvider) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      customDropDownProvider.setValue(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<dynamic>> items = [];

    if (itemTextStyle == null) itemTextStyle = TextStyle(color: Colors.black, fontSize: 10);
    if (hintTextStyle == null) hintTextStyle = TextStyle(color: Colors.grey, fontSize: 10);
    if (selectedItemTextStyle == null) selectedItemTextStyle = itemTextStyle;
    if (icon == null) icon = Icon(Icons.keyboard_arrow_down, size: iconSize, color: Colors.black);
    items = menuItems.map((item) {
      return DropdownMenuItem(
        child: new Text(item["text"], style: itemTextStyle),
        value: item["value"],
      );
    }).toList();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CustomDropDownProvider()),
      ],
      child: Consumer<CustomDropDownProvider>(
        builder: (context, customDropDownProvider, _) {
          if (customDropDownProvider.value == null) init(customDropDownProvider);
          return IgnorePointer(
            ignoring: disabled,
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.symmetric(horizontal: padding),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: (borderType == 2) ? BorderRadius.circular(borderRadius) : null,
                border: (borderType == 2)
                    ? Border.all(color: (disabled) ? Colors.grey : borderColor, style: BorderStyle.solid, width: borderWidth)
                    : Border(bottom: BorderSide(color: (disabled) ? Colors.grey : borderColor, style: BorderStyle.solid, width: borderWidth)),
              ),
              child: DropdownButton(
                itemHeight: height <= kMinInteractiveDimension ? null : height,
                underline: SizedBox(),
                hint: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(hintText, style: hintTextStyle),
                  ],
                ),
                value: (customDropDownProvider.value == null) ? value : customDropDownProvider.value,
                isExpanded: isExpanded,
                onChanged: (newValue) {
                  if (onChangeHandler != null) onChangeHandler(newValue);
                  customDropDownProvider.setValue(newValue);
                },
                icon: icon,
                items: items,
                dropdownColor: dropdownColor,
                selectedItemBuilder: (BuildContext context) {
                  return menuItems.map<Widget>((item) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(item["text"], style: selectedItemTextStyle),
                      ],
                    );
                  }).toList();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomDropDownProvider extends ChangeNotifier {
  static CustomDropDownProvider of(BuildContext context, {bool listen = false}) => Provider.of<CustomDropDownProvider>(context, listen: listen);

  dynamic _value;
  dynamic get value => _value;

  void setValue(dynamic value) {
    if (_value != value) {
      _value = value;
      notifyListeners();
    }
  }
}
