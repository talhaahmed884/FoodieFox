import 'package:email_validator/email_validator.dart';
import 'package:foodiefox/CustomerValidate.dart';

class CustomerValidator implements CustomerValidate {
  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool validatePassword(String password) {
    if (password.length >= 5) {
      return true;
    }
    return false;
  }

  bool validateCellNo(String cellNo) {
    if (cellNo.contains('+')) {
      if (cellNo.length != 13) {
        return false;
      }
      cellNo.replaceAll('+', '');
    } else if (cellNo.length != 11) {
      return false;
    }

    if (num.tryParse(cellNo) != null) {
      return true;
    }
    return false;
  }

  bool validateName(String firstName, String lastName) {
    if (firstName != null && lastName != null) {
      if (firstName.isNotEmpty && lastName.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
