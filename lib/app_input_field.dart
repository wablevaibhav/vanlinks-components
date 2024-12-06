import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class AppInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String hint;
  final double? radius;
  final String? helperText;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final bool enabled;
  final bool readOnly;
  final TextInputType? textInputType;
  final Color color;
  final Color borderColor;
  final Color focusColor;
  final double? elevation;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final int? minLength;
  final TextCapitalization? textCapitalization;
  final void Function()? trailingTapped;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final EdgeInsets? contentPadding;
  final TextStyle? labelStyle;
  final void Function()? onTap;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? shadowColor;
  final bool? isMaterialApp;

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
    this.elevation = 0,
    this.maxLength,
    this.maxLines,
    this.radius,
    this.minLength,
    this.onChanged,
    this.contentPadding,
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
    this.shadowColor,
    this.onFieldSubmitted,
    this.isMaterialApp = true,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return widget.isMaterialApp == true
        ? Material(
            elevation: widget.elevation ?? 5,
            shadowColor: widget.shadowColor ?? VanlinksColors.blackColor,
            borderRadius: BorderRadius.circular(widget.radius ?? 30),
            child: TextFormField(
              onTap: widget.onTap,
              onFieldSubmitted: widget.onFieldSubmitted,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              validator: widget.validator,
              enabled: widget.enabled,
              focusNode: widget.focusNode,
              onChanged: (val) {
                if (widget.onChanged != null) widget.onChanged!(val);
              },
              textCapitalization: widget.textCapitalization!,
              controller: widget.controller,
              keyboardType: widget.textInputType,
              minLines: widget.minLength,
              maxLines: widget.maxLines ?? 1,
              maxLength: widget.maxLength,
              readOnly: widget.readOnly,
              inputFormatters: <TextInputFormatter>[
                if (widget.textInputType == TextInputType.phone)
                  LengthLimitingTextInputFormatter(10),
                if (widget.textInputType == TextInputType.phone)
                  FilteringTextInputFormatter.digitsOnly,
                if (widget.textInputType == TextInputType.number)
                  FilteringTextInputFormatter.digitsOnly,
                if (widget.textInputType ==
                    const TextInputType.numberWithOptions(
                        decimal: true, signed: false))
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                if (widget.textInputType ==
                    const TextInputType.numberWithOptions(
                        decimal: true, signed: false))
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    try {
                      final text = newValue.text;
                      if (text.isNotEmpty) double.parse(text);
                      return newValue;
                    } catch (e) {
                      Log.debug("$e");
                    }
                    return oldValue;
                  }),
              ],
              style: widget.style ?? VanlinksTextStyle.small,
              obscureText: widget.password,
              cursorColor: VanlinksColors.blackColor,
              decoration: InputDecoration(
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 16.0),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(color: Colors.black, width: 0.43),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      color: VanlinksColors.redColor, width: 0.43),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 10),
                  borderSide: BorderSide(color: widget.focusColor, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 10),
                  borderSide: BorderSide(color: widget.borderColor, width: 1),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 10),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
                labelStyle: widget.labelStyle ?? VanlinksTextStyle.subheadingH6,
                hintStyle: widget.hintStyle ?? VanlinksTextStyle.small,
              ),
            ),
          )
        : TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTap: widget.onTap,
            onFieldSubmitted: widget.onFieldSubmitted,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            validator: widget.validator,
            enabled: widget.enabled,
            focusNode: widget.focusNode,
            onChanged: (val) {
              if (widget.onChanged != null) widget.onChanged!(val);
            },
            textCapitalization: widget.textCapitalization!,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            minLines: widget.minLength,
            maxLines: widget.maxLines ?? 1,
            maxLength: widget.maxLength,
            readOnly: widget.readOnly,
            inputFormatters: <TextInputFormatter>[
              if (widget.textInputType == TextInputType.phone)
                LengthLimitingTextInputFormatter(10),
              if (widget.textInputType == TextInputType.phone)
                FilteringTextInputFormatter.digitsOnly,
              if (widget.textInputType == TextInputType.number)
                FilteringTextInputFormatter.digitsOnly,
              if (widget.textInputType ==
                  const TextInputType.numberWithOptions(
                      decimal: true, signed: false))
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
              if (widget.textInputType ==
                  const TextInputType.numberWithOptions(
                      decimal: true, signed: false))
                TextInputFormatter.withFunction((oldValue, newValue) {
                  try {
                    final text = newValue.text;
                    if (text.isNotEmpty) double.parse(text);
                    return newValue;
                  } catch (e) {
                    Log.debug("$e");
                  }
                  return oldValue;
                }),
            ],
            style: widget.style ?? VanlinksTextStyle.small,
            obscureText: widget.password,
            cursorColor: VanlinksColors.blackColor,
            decoration: InputDecoration(
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16.0),
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 10),
                borderSide: const BorderSide(color: Colors.black, width: 0.43),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 10),
                borderSide: const BorderSide(
                    color: VanlinksColors.redColor, width: 0.43),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 10),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 10),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 10),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              labelStyle: widget.labelStyle ?? VanlinksTextStyle.subheadingH6,
              hintStyle: widget.hintStyle ?? VanlinksTextStyle.small,
            ),
          );
  }
}
