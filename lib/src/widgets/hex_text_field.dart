import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_colors.dart';
import '../models/text_field_options.dart';
import '../utils/enums.dart';

class HexTextField extends StatefulWidget {
  const HexTextField({
    this.disabled = false,
    this.hintStyle,
    this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.textAlign = TextAlign.left,
    this.textEditingController,
    this.textInputFormatters,
    this.textInputType,
    this.leadingWidget,
    this.trailingWidget,
    this.errorValidator,
    this.warningValidator,
    this.successValidator,
    this.errorTextStyle,
    this.warningTextStyle,
    this.successTextStyle,
    this.disabledOptions,
    this.errorOptions,
    this.focusedOptions,
    this.successOptions,
    this.textFieldOptions,
    this.warningOptions,
    super.key,
  });

  /// Whether the text field is disabled.
  final bool disabled;

  /// The style to use for the hint text.
  final TextStyle? hintStyle;

  /// The text to display when the text field is empty.
  final String? hintText;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  /// Called when the text being edited changes.
  final ValueChanged<String>? onChanged;

  /// Called when the user submits editable content (e.g., user presses the "done" button on the keyboard).
  final ValueChanged<String>? onSubmitted;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The controller to use for the text field.
  final TextEditingController? textEditingController;

  /// The input formatters for the text field.
  final List<TextInputFormatter>? textInputFormatters;

  /// The type of keyboard to use for editing the text.
  final TextInputType? textInputType;

  /// The widget to display at the start of the text field.
  final Widget? leadingWidget;

  /// The widget to display at the end of the text field.
  final Widget? trailingWidget;

  /// The validator for the error condition.
  final String? Function(String?)? errorValidator;

  /// The validator for the warning condition.
  final String? Function(String?)? warningValidator;

  /// The validator for successful condition.
  final String? Function(String?)? successValidator;

  /// The text style for the error message.
  final TextStyle? errorTextStyle;

  /// The text style for the warning message.
  final TextStyle? warningTextStyle;

  /// The text style for the success message.
  final TextStyle? successTextStyle;

  /// The options for the text field when it is disabled.
  final TextFieldOptions? disabledOptions;

  /// The options for the text field when it has an error.
  final TextFieldOptions? errorOptions;

  /// The options for the text field when it is focused.
  final TextFieldOptions? focusedOptions;

  /// The options for the text field when it is successful.
  final TextFieldOptions? successOptions;

  /// The default options for the text field.
  final TextFieldOptions? textFieldOptions;

  /// The options for the text field when it has a warning.
  final TextFieldOptions? warningOptions;

  @override
  State<HexTextField> createState() => _HexTextFieldState();
}

class _HexTextFieldState extends State<HexTextField> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  TextFieldType textFieldType = TextFieldType.unfocused;
  String? errorMessage;
  String? warningMessage;
  String? successMessage;

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    checkDisabled();
    super.initState();
  }

  void _onFocusChange() {
    if (textFieldType == TextFieldType.unfocused && _focusNode.hasFocus) {
      setState(() {
        textFieldType = TextFieldType.focused;
      });
    } else if (textFieldType == TextFieldType.focused) {
      setState(() {
        textFieldType = TextFieldType.unfocused;
      });
    }
  }

  void checkDisabled() {
    if (widget.disabled) {
      setState(() {
        textFieldType = TextFieldType.disabled;
      });
    }
  }

  Color getBackgroundColor() {
    switch (textFieldType) {
      case TextFieldType.unfocused:
        return widget.textFieldOptions?.backgroundColor ??
            AppColors.neutralD500;
      case TextFieldType.focused:
        return widget.focusedOptions?.backgroundColor ?? AppColors.neutralD500;
      case TextFieldType.error:
        return widget.errorOptions?.backgroundColor ?? AppColors.neutralD500;
      case TextFieldType.warning:
        return widget.warningOptions?.backgroundColor ?? AppColors.neutralD500;
      case TextFieldType.success:
        return widget.successOptions?.backgroundColor ?? AppColors.neutralD500;
      case TextFieldType.disabled:
        return widget.disabledOptions?.backgroundColor ?? AppColors.neutralD500;
    }
  }

  Color getOutlineColor() {
    switch (textFieldType) {
      case TextFieldType.unfocused:
        return widget.textFieldOptions?.outlineColor ?? AppColors.neutralD100;
      case TextFieldType.focused:
        return widget.focusedOptions?.outlineColor ?? AppColors.primary500;
      case TextFieldType.error:
        return widget.errorOptions?.outlineColor ?? AppColors.error;
      case TextFieldType.warning:
        return widget.warningOptions?.outlineColor ?? AppColors.warning;
      case TextFieldType.success:
        return widget.successOptions?.outlineColor ?? AppColors.success;
      case TextFieldType.disabled:
        return widget.disabledOptions?.outlineColor ?? AppColors.neutralD100;
    }
  }

  double getOutlineWidth() {
    switch (textFieldType) {
      case TextFieldType.unfocused:
        return widget.textFieldOptions?.outlineWidth ?? 2;
      case TextFieldType.focused:
        return widget.focusedOptions?.outlineWidth ?? 2;
      case TextFieldType.error:
        return widget.errorOptions?.outlineWidth ?? 2;
      case TextFieldType.warning:
        return widget.warningOptions?.outlineWidth ?? 2;
      case TextFieldType.success:
        return widget.successOptions?.outlineWidth ?? 2;
      case TextFieldType.disabled:
        return widget.disabledOptions?.outlineWidth ?? 2;
    }
  }

  Color getCursorColor() {
    switch (textFieldType) {
      case TextFieldType.unfocused:
        return widget.textFieldOptions?.cursorColor ?? AppColors.primary500;
      case TextFieldType.focused:
        return widget.focusedOptions?.cursorColor ?? AppColors.primary500;
      case TextFieldType.error:
        return widget.errorOptions?.cursorColor ?? AppColors.primary500;
      case TextFieldType.warning:
        return widget.warningOptions?.cursorColor ?? AppColors.primary500;
      case TextFieldType.success:
        return widget.successOptions?.cursorColor ?? AppColors.primary500;
      case TextFieldType.disabled:
        return widget.disabledOptions?.cursorColor ?? AppColors.primary500;
    }
  }

  double getCursorWidth() {
    switch (textFieldType) {
      case TextFieldType.unfocused:
        return widget.textFieldOptions?.cursorWidth ?? 2;
      case TextFieldType.focused:
        return widget.focusedOptions?.cursorWidth ?? 2;
      case TextFieldType.error:
        return widget.errorOptions?.cursorWidth ?? 2;
      case TextFieldType.warning:
        return widget.warningOptions?.cursorWidth ?? 2;
      case TextFieldType.success:
        return widget.successOptions?.cursorWidth ?? 2;
      case TextFieldType.disabled:
        return widget.disabledOptions?.cursorWidth ?? 2;
    }
  }

  bool getShowCursor() {
    switch (textFieldType) {
      case TextFieldType.unfocused:
        return widget.textFieldOptions?.showCursor ?? true;
      case TextFieldType.focused:
        return widget.focusedOptions?.showCursor ?? true;
      case TextFieldType.error:
        return widget.errorOptions?.showCursor ?? true;
      case TextFieldType.warning:
        return widget.warningOptions?.showCursor ?? true;
      case TextFieldType.success:
        return widget.successOptions?.showCursor ?? true;
      case TextFieldType.disabled:
        return widget.disabledOptions?.showCursor ?? true;
    }
  }

  TextStyle getTextStyle() {
    switch (textFieldType) {
      case TextFieldType.unfocused:
        return widget.textFieldOptions?.textStyle ??
            TextStyle(
              color: AppColors.neutralL500,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            );
      case TextFieldType.focused:
        return widget.focusedOptions?.textStyle ??
            TextStyle(
              color: AppColors.neutralL500,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            );
      case TextFieldType.error:
        return widget.errorOptions?.textStyle ??
            TextStyle(
              color: AppColors.error,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            );
      case TextFieldType.warning:
        return widget.warningOptions?.textStyle ??
            TextStyle(
              color: AppColors.warning,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            );
      case TextFieldType.success:
        return widget.successOptions?.textStyle ??
            TextStyle(
              color: AppColors.success,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            );
      case TextFieldType.disabled:
        return widget.disabledOptions?.textStyle ??
            TextStyle(
              color: AppColors.neutralL900,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            );
    }
  }

  TextStyle getMessageTextStyle() {
    if (errorMessage != null) {
      return widget.errorTextStyle ??
          TextStyle(
            color: AppColors.error,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          );
    } else if (warningMessage != null) {
      return widget.warningTextStyle ??
          TextStyle(
            color: AppColors.warning,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          );
    } else if (successMessage != null) {
      return widget.successTextStyle ??
          TextStyle(
            color: AppColors.success,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          );
    } else {
      return const TextStyle(
        color: Colors.transparent,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.string(
              '''
          <svg
            width="319"
            height="48"
            viewBox="0 0 319 48"
            fill="none"
            xmlns="http://www.w3.org/2000/svg">
              <path
                fill="${getBackgroundColor().toHex()}"
                stroke="${getOutlineColor().toHex()}"
                stroke-width="${getOutlineWidth()}"
                d="M13.4704 5.35804C16.3872 2.28813 20.4363 0.550004 24.6709 0.550003L293.758 0.549947C297.896 0.549946 301.862 2.2105 304.766 5.15947L313.107 13.6302C319.244 19.8614 318.989 29.9389 312.547 35.8527L304.675 43.0784C301.825 45.6948 298.096 47.1465 294.227 47.1465L24.1976 47.1466C20.2333 47.1466 16.4206 45.6227 13.5484 42.8902L5.9638 35.6746C-0.21552 29.7959 -0.462305 20.0219 5.41246 13.8389L13.4704 5.35804Z"/>
          </svg>

          ''',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 22),
              child: Text(
                errorMessage ?? warningMessage ?? successMessage ?? 'hey',
                style: getMessageTextStyle(),
              ),
            ),
          ],
        ),
        Positioned(
          left: 25,
          child: SizedBox(
            width: 270,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: widget.leadingWidget != null,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: widget.leadingWidget,
                  ),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: widget.textEditingController,
                      cursorColor: getCursorColor(),
                      cursorWidth: getCursorWidth(),
                      enabled: !widget.disabled,
                      focusNode: _focusNode,
                      inputFormatters: widget.textInputFormatters,
                      keyboardType: widget.textInputType,
                      maxLines: 1,
                      obscureText: widget.obscureText,
                      onChanged: widget.onChanged ??
                          (value) {
                            _formKey.currentState!.validate();
                          },
                      onFieldSubmitted: widget.onSubmitted,
                      showCursor: getShowCursor(),
                      style: getTextStyle(),
                      textAlign: widget.textAlign,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        hintStyle: widget.hintStyle ??
                            TextStyle(
                              color: AppColors.neutralL900,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                        hintText: widget.hintText,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (widget.errorValidator != null) {
                          String? errorMsg = widget.errorValidator!(value);
                          if (errorMsg != null) {
                            setState(() {
                              log("here: $textFieldType");
                              textFieldType = TextFieldType.error;
                              log("here 2: $textFieldType");
                              errorMessage = errorMsg;
                            });
                          } else {
                            setState(() {
                              errorMessage = null;
                            });
                          }
                        }
                        if (widget.warningValidator != null) {
                          String? warningMsg = widget.warningValidator!(value);
                          if (warningMsg != null) {
                            setState(() {
                              textFieldType = TextFieldType.warning;
                              warningMessage = warningMsg;
                            });
                          } else {
                            setState(() {
                              warningMessage = null;
                            });
                          }
                        }
                        if (widget.successValidator != null) {
                          String? successMsg = widget.successValidator!(value);
                          if (successMsg != null) {
                            setState(() {
                              textFieldType = TextFieldType.success;
                              successMessage = successMsg;
                            });
                          } else {
                            setState(() {
                              successMessage = null;
                            });
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.trailingWidget != null,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: widget.trailingWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
