import 'package:email_validator/email_validator.dart';

class Validator {
  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool validateCellNo(String cellNo) {
    if (cellNo.contains('+92', 0)) {
      if (cellNo.length != 13) {
        return false;
      }
      cellNo.replaceAll('+', '');
      if (num.tryParse(cellNo) != null) {
        return true;
      }
    } else {
      if (cellNo.length == 11) {
        if (cellNo.startsWith('0')) {
          return true;
        }
      }
    }
    return false;
  }

  String transformPhoneNumber(String cellNo) {
    if (cellNo.startsWith('0')) {
      cellNo = cellNo.replaceRange(0, 1, '+92');
    }

    return cellNo;
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
