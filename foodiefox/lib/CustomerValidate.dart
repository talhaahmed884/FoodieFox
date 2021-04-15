import 'package:foodiefox/Validate.dart';

abstract class CustomerValidate extends Validate {
  bool validateCellNo(String cellNo);

  bool validateName(String name);
}
