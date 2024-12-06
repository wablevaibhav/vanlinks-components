import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:vanlinks_components/vanlinks_components.dart";

class CustomSearchDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final bool? isMenu;
  final bool? isEnable;
  final bool showSearchBox;
  final String? emptyText;
  final String? title;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? label;
  final TextStyle? labelStyle;
  final bool? isMaterialApp;
  final Widget? leading;
  const CustomSearchDropdown(
      {super.key,
      required this.items,
      this.title,
      this.style,
      this.selectedValue,
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
      this.isMaterialApp = true,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return isMaterialApp == true
        ? Material(
            elevation: 4,
            shadowColor: VanlinksColors.blackColor,
            borderRadius: BorderRadius.circular(8),
            child: Column(
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
                DropdownSearch<String>(
                  validator: validator,
                  enabled: isEnable ?? true,
                  selectedItem: selectedValue,
                  onChanged: onChanged,
                  popupProps: isMenu == true
                      ? PopupProps.menu(
                          listViewProps: const ListViewProps(
                              dragStartBehavior: DragStartBehavior.down),
                          loadingBuilder: (context, searchEntry) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, searchEntry, exception) {
                            return const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("something went wrong"));
                          },
                          emptyBuilder: (context, searchEntry) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(emptyText ?? "No Data Found"),
                            );
                          },
                          fit: FlexFit.loose,
                          showSearchBox: showSearchBox)
                      : PopupProps.dialog(
                          dialogProps: const DialogProps(
                              backgroundColor: VanlinksColors.whiteColor,
                              elevation: 8),
                          listViewProps: const ListViewProps(
                              dragStartBehavior: DragStartBehavior.down),
                          loadingBuilder: (context, searchEntry) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, searchEntry, exception) {
                            return const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("Something went wrong!!"));
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
                      hintStyle: hintStyle ??
                          VanlinksTextStyle.mediumHint
                              .copyWith(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: VanlinksColors.blackColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: VanlinksColors.blackColor, width: 1)),
                    ),
                  ),
                  items: items,
                ),
              ],
            ),
          )
        : Column(
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
              DropdownSearch<String>(
                validator: validator,
                enabled: isEnable ?? true,
                selectedItem: selectedValue,
                onChanged: onChanged,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                popupProps: isMenu == true
                    ? PopupProps.menu(
                        listViewProps: const ListViewProps(
                            dragStartBehavior: DragStartBehavior.down),
                        loadingBuilder: (context, searchEntry) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, searchEntry, exception) {
                          return const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("something went wrong"));
                        },
                        emptyBuilder: (context, searchEntry) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(emptyText ?? "No Data Found"),
                          );
                        },
                        fit: FlexFit.loose,
                        showSearchBox: showSearchBox)
                    : PopupProps.dialog(
                        dialogProps: const DialogProps(
                            backgroundColor: VanlinksColors.whiteColor,
                            elevation: 8),
                        listViewProps: const ListViewProps(
                            dragStartBehavior: DragStartBehavior.down),
                        loadingBuilder: (context, searchEntry) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, searchEntry, exception) {
                          return const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("Something went wrong!!"));
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
                    prefixIcon: leading,
                    labelStyle: labelStyle ?? VanlinksTextStyle.subheadingH6,
                    contentPadding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                    hintText: hintText ?? "Select",
                    hintStyle: VanlinksTextStyle.mediumHint
                        .copyWith(color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: VanlinksColors.blackColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: VanlinksColors.blackColor, width: 1)),
                  ),
                ),
                items: items,
              ),
            ],
          );
  }
}
