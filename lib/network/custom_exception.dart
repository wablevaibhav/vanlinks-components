class CustomException implements Exception {
  final String? _message;
  final String? _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(
            message ?? "Unable to fetch data", "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([String? message])
      : super(message ?? "The request was invalid", "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String? message])
      : super(message ?? "You are not authorized to perform this action",
            "Unauthorized Access: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message])
      : super(message ?? "The input provided is not valid", "Invalid Input: ");
}
