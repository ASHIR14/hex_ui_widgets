import 'package:flutter/cupertino.dart';

class TextFieldOptions {
  /// The color of the background of the text field.
  Color? backgroundColor;

  /// The color of the outline of the text field.
  Color? outlineColor;

  /// How thick the outline of the text field will be.
  double? outlineWidth;

  /// The color of the cursor.
  Color? cursorColor;

  /// How thick the cursor will be.
  double? cursorWidth;

  /// Whether to show the cursor.
  bool? showCursor;

  /// The style to use for the text being edited.
  TextStyle? textStyle;

  TextFieldOptions({
    this.backgroundColor,
    this.outlineColor,
    this.outlineWidth,
    this.cursorColor,
    this.cursorWidth,
    this.showCursor,
    this.textStyle,
  });
}
