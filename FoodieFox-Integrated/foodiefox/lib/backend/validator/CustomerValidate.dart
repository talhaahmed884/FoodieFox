import 'package:foodiefox/backend/validator/Validate.dart';

abstract class CustomerValidate extends Validate {
  bool validateCellNo(String cellNo);

  bool validateName(String name);
}
