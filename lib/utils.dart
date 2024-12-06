import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vanlinks_components/vanlinks_colors.dart';

extension StringExtension on String? {
  String toCapitalize() {
    if (this == null) {
      return "";
    } else if (this!.isEmpty) {
      return "";
    } else {
      return "${this![0].toUpperCase()}${this!.substring(1)}";
    }
  }

  bool isValid() {
    if (this == null) {
      return false;
    } else if (this!.isEmpty) {
      return false;
    } else if (this == "null") {
      return false;
    } else {
      return true;
    }
  }

  bool equalsIgnoreCase(String? string2) {
    return this?.toLowerCase() == string2?.toLowerCase();
  }

  double toParseDouble() {
    if (this == null) {
      return 0.0;
    } else if (this!.isEmpty) {
      return 0.0;
    } else {
      return double.tryParse(this!) ?? 0.0;
    }
  }

  int toParseInt() {
    if (this == null) {
      return 0;
    } else if (this!.isEmpty) {
      return 0;
    } else {
      return int.tryParse(this!) ?? 0;
    }
  }

  bool isIntNumericUsingRegularExpression() {
    if (!isValid()) {
      return false;
    }
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)))$');

    return numericRegex.hasMatch(this!);
  }

  bool isDoubleNumericUsingRegularExpression() {
    if (!isValid()) {
      return false;
    }
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(this!);
  }
}

String toTitleCase(String str) {
  if (!str.isValid()) {
    return "";
  }
  return str
      .replaceAllMapped(
          RegExp(
              r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
          (Match m) =>
              "${m[0]![0].toUpperCase()}${m[0]!.substring(1).toLowerCase()}")
      .replaceAll(RegExp(r'(_|-)+'), ' ');
}

class TitleCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: toTitleCase(newValue.text),
      selection: newValue.selection,
    );
  }
}

class CommonValidationUtils {
  static Future<File> writeToFile(ByteData data, String fileName) async {
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = '$tempPath/$fileName';
    return File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  static Future<String> downloadAndSaveFile(String url, String fileName) async {
    Directory directory = await getTemporaryDirectory();
    var filePath = '${directory.path}/$fileName';
    var response = await get(Uri.parse(url));
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  static Future<bool> checkInternetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static hideKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static String addLeadingZeroIfNeeded(int? value) {
    if (value != null && value < 10) return '0$value';

    return (value ?? 0).toString();
  }

  static bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static bool isValidPhone(String? s) {
    if (s == null) {
      return false;
    }
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (s.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(s)) {
      return false;
    }
    return true;
  }

  static bool isValidEmail(String? s) {
    if (s == null) {
      return false;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(s);
  }

  static bool isValidPassword(String? s) {
    if (s == null) {
      return false;
    }
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$')
        .hasMatch(s);
  }

  static Color hexToColor(String? code, [Color? defaultColor]) {
    if (code == null || code.isEmpty || code == "null") {
      return defaultColor ?? VanlinksColors.primaryColor;
    }

    final validHexColorPattern = RegExp(r'^#?([0-9a-fA-F]{6})$');
    if (!validHexColorPattern.hasMatch(code)) {
      return defaultColor ?? VanlinksColors.primaryColor;
    }

    return Color(
        int.parse(code.substring(code.startsWith('#') ? 1 : 0), radix: 16) +
            0xFF000000);
  }

  static String setText(String? text, String defaultText) {
    return text == null || text.isEmpty || text == "null" ? defaultText : text;
  }

  static String getDuration(String tillDate, String fromDate) {
    Duration duration =
        DateTime.parse(fromDate).difference(DateTime.parse(tillDate));
    int years = (duration.inDays / 365).floor();
    int months = ((duration.inDays % 365) / 30).floor();
    int days = (duration.inDays % 30);
    String durationString = '0';

    if (days >= 0) {
      days++;
      durationString = '$days ${days > 1 ? 'days' : 'day'}';
    }

    if (years > 0) {
      durationString = '$years ${years > 1 ? 'years' : 'year'} ';
    }
    if (months > 0) {
      durationString = '$months ${months > 1 ? 'months' : 'month'} ';
    }

    return durationString;
  }

  static String getDayAndMonthFromString(String dateString) {
    final dateTime = DateTime.parse(dateString);
    final day = dateTime.day;

    final formattedDay = day.toString();
    final formattedMonth = DateFormat.MMM().format(dateTime);

    return '$formattedDay $formattedMonth';
  }
}
