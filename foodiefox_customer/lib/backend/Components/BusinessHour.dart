class BusinessHour {
  String _open = '';
  String _close = '';

  BusinessHour() {
    _open = '';
    _close = '';
  }

  BusinessHour.parameterized(String open, String close) {
    _open = open.toString();
    _close = close.toString();
  }

  void setOpen(String open) {
    _open = open;
  }

  void setClose(String close) {
    _close = close;
  }

  String getOpen() {
    return _open;
  }

  String getClose() {
    return _close;
  }

  String toString() {
    return _open + ' - ' + _close + '\n';
  }
}
