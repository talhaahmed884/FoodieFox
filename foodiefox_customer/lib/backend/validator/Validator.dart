import 'package:email_validator/email_validator.dart';

class Validator {
  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool validateCellNo(String cellNo) {
    if (cellNo.contains('+')) {
      if (cellNo.length != 13) {
        return false;
      }
      cellNo.replaceAll('+', '');
      if (num.tryParse(cellNo) != null) {
        return true;
      }
    }
    return false;
  }

  bool validateName(String name) {
    if (name != null) {
      if (name.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
