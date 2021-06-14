import 'DetailOptions.dart';

class DetailTitle {
  String _name = '';
  List<DetailOptions> detailOptions = [];

  DetailTitle() {
    _name = '';
  }

  DetailTitle.parameterized(String name) {
    _name = name;
  }

  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  String toString() {
    return _name + '\n';
  }
}
