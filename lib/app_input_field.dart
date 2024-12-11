import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class AppInputField extends StatefulWidget {
  const AppInputField({
    super.key,
    this.controller,
    this.label = '',
    this.hint = '',
    this.leading,
    this.focusNode,
    this.trailing,
    this.trailingTapped,
    this.password = false,
    this.enabled = true,
    this.readOnly = false,
    this.elevation = 0.0,
    this.maxLength,
    this.maxLines = 1,
    this.radius = 30.0, // Default radius
    this.minLength,
    this.onChanged,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.color = Colors.transparent,
    this.borderColor = Colors.black,
    this.focusColor = Colors.black,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.helperText,
    this.validator,
    this.onTap,
    this.labelStyle,
    this.style,
    this.hintStyle,
    this.shadowColor = Colors.black,
    this.onFieldSubmitted,
    this.isMaterialApp = true,
  });

  final TextEditingController? controller;
  final String label;
  final String hint;
  final double radius;
  final String? helperText;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final bool enabled;
  final bool readOnly;
  final TextInputType textInputType;
  final Color color;
  final Color borderColor;
  final Color focusColor;
  final double elevation;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final int? minLength;
  final TextCapitalization textCapitalization;
  final void Function()? trailingTapped;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final EdgeInsets contentPadding;
  final TextStyle? labelStyle;
  final void Function()? onTap;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color shadowColor;
  final bool isMaterialApp;

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  @override
  Widget build(BuildContext context) {
    final inputField = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.textInputType,
      obscureText: widget.password,
      cursorColor: VanlinksColors.blackColor,
      style: widget.style ?? VanlinksTextStyle.small,
      minLines: widget.minLength,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      inputFormatters: _buildInputFormatters(),
      decoration: _buildInputDecoration(),
    );

    if (!widget.isMaterialApp) {
      return inputField;
    }

    return Material(
      elevation: widget.elevation,
      shadowColor: widget.shadowColor,
      borderRadius: BorderRadius.circular(widget.radius),
      child: inputField,
    );
  }

  List<TextInputFormatter> _buildInputFormatters() {
    final inputFormatters = <TextInputFormatter>[];

    if (widget.textInputType == TextInputType.phone) {
      inputFormatters.add(LengthLimitingTextInputFormatter(10));
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    if (widget.textInputType == TextInputType.number) {
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    if (widget.textInputType ==
        const TextInputType.numberWithOptions(decimal: true)) {
      inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")));
      inputFormatters.add(TextInputFormatter.withFunction((oldValue, newValue) {
        try {
          if (newValue.text.isNotEmpty) double.parse(newValue.text);
          return newValue;
        } catch (e) {
          return oldValue;
        }
      }));
    }

    return inputFormatters;
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      contentPadding: widget.contentPadding,
      hintText: widget.hint,
      labelText: widget.label,
      helperText: widget.helperText,
      filled: true,
      fillColor: widget.color,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: widget.leading,
      suffixIcon: widget.trailing != null
          ? GestureDetector(
              onTap: widget.trailingTapped,
              child: SizedBox(
                width: 30,
                height: 30,
                child: widget.trailing,
              ),
            )
          : null,
      border: _buildBorder(widget.borderColor),
      enabledBorder: _buildBorder(widget.borderColor),
      focusedBorder: _buildBorder(widget.focusColor, width: 1),
      errorBorder: _buildBorder(VanlinksColors.redColor),
      disabledBorder: _buildBorder(Colors.grey),
      labelStyle: widget.labelStyle ?? VanlinksTextStyle.subheadingH6,
      hintStyle: widget.hintStyle ?? VanlinksTextStyle.small,
    );
  }

  OutlineInputBorder _buildBorder(Color color, {double width = 0.43}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
