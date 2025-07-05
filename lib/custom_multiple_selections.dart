import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class CustomMultipleSelections extends StatelessWidget {
  final List<String> items;
  final List<String>? selectedValues;
  final void Function(List<String>?)? onChanged;
  final void Function(List<String>?)? onSaved;
  final bool? isMenu;
  final bool? isEnable;
  final bool showSearchBox;
  final String? emptyText;
  final String? title;
  final String? Function(List<String>?)? validator;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? label;
  final TextStyle? labelStyle;

  const CustomMultipleSelections({
    super.key,
    required this.items,
    this.title,
    this.style,
    this.selectedValues,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.isEnable = true,
    this.emptyText,
    this.hintText,
    this.hintStyle,
    required this.showSearchBox,
    this.isMenu = false,
    this.label = '',
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null || title == '')
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title ?? "",
              style: style,
            ),
          ),
        DropdownSearch<String>.multiSelection(
          validator: validator,
          enabled: isEnable ?? true,
          selectedItems: selectedValues ?? [],
          onChanged: onChanged,
          popupProps: isMenu == true
              ? PopupPropsMultiSelection.menu(
                  listViewProps: const ListViewProps(dragStartBehavior: DragStartBehavior.down),
                  loadingBuilder: (context, searchEntry) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, searchEntry, exception) {
                    return const Padding(padding: EdgeInsets.all(12.0), child: Text("Something went wrong"));
                  },
                  emptyBuilder: (context, searchEntry) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(emptyText ?? "No Data Found"),
                    );
                  },
                  fit: FlexFit.loose,
                  showSearchBox: showSearchBox)
              : PopupPropsMultiSelection.dialog(
                  dialogProps: const DialogProps(backgroundColor: VanlinksColors.whiteColor, elevation: 8),
                  listViewProps: const ListViewProps(dragStartBehavior: DragStartBehavior.down),
                  loadingBuilder: (context, searchEntry) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, searchEntry, exception) {
                    return const Padding(padding: EdgeInsets.all(12.0), child: Text("Something went wrong!!"));
                  },
                  emptyBuilder: (context, searchEntry) {
                    return const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("No Data Found"),
                    );
                  },
                  fit: FlexFit.loose,
                  showSearchBox: showSearchBox),
          dropdownButtonProps: const DropdownButtonProps(),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: label,
              labelStyle: labelStyle ?? VanlinksTextStyle.subheadingH6,
              contentPadding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
              hintText: hintText ?? "Select",
              hintStyle: VanlinksTextStyle.mediumHint.copyWith(
                color: Colors.grey.shade400,
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: VanlinksColors.blackColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: VanlinksColors.blackColor, width: 1)),
            ),
          ),
          items: items,
        ),
      ],
    );
  }
}
