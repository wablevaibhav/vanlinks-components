import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vanlinks_components/vanlinks_components.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    this.dateController,
    required this.dateFormat,
    this.onChanged,
    this.dateValidator,
    this.width = 200,
    this.height = 40,
    this.hintText = "",
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.backgroundColor,
    this.enabled,
  }) : assert(dateController == null || initialDate == null,
            "An initial value or a date controller must be provided but both can't be provided at the same time.");

  final Color? backgroundColor;

  final TextEditingController? dateController;

  final DateFormat dateFormat;

  final double width;

  final double height;

  final String hintText;

  final DateTime? initialDate;

  final DateTime? firstDate;

  final DateTime? lastDate;

  final String? Function(dynamic)? dateValidator;

  final ValueChanged<DateTime?>? onChanged;

  final bool? enabled;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    String? formattedDate;
    if (widget.initialDate != null) {
      formattedDate = widget.dateFormat.format(widget.initialDate!);
    }
    _dateController =
        widget.dateController ?? TextEditingController(text: formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
        validator: widget.dateValidator,
        builder: (fieldState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0,
                    color:
                        fieldState.hasError ? Colors.red : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(
                    6,
                  ),
                  color: widget.backgroundColor ?? const Color(0xFFE1EDF8),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: InkWell(
                        onTap: widget.enabled == null || widget.enabled == true
                            ? () {
                                _showPicker();
                              }
                            : null,
                        child: const Icon(
                          Icons.calendar_today,
                          color: VanlinksColors.primaryColor,
                        ),
                      ),
                    ),
                    if (_dateController.text.isNotEmpty &&
                        widget.enabled == true) ...[
                      const SizedBox(
                        width: 8.0,
                        height: 16.0,
                      ),
                      SizedBox(
                        width: 18.0,
                        height: 18.0,
                        child: InkWell(
                          onTap: () {
                            _clearPicker();
                          },
                          child: const Icon(
                            Icons.check_circle_outline,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              if (fieldState.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    fieldState.errorText ?? "",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          );
        });
  }

  void _showPicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1973),
      lastDate: widget.lastDate ?? DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: VanlinksColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      String formattedDate = widget.dateFormat.format(pickedDate);
      if (widget.onChanged != null) widget.onChanged!(pickedDate);
      setState(() {
        _dateController.text = formattedDate.toString();
      });
    }
  }

  void _clearPicker() async {
    setState(() {
      _dateController.text = "";
      widget.onChanged?.call(null);
    });
  }
}
