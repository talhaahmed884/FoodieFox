class BusinessHour {
  String _open = '';
  String _close = '';

  BusinessHour() {
    _open = '';
    _close = '';
  }

  BusinessHour.parameterized(
      int open, String openPeriod, int close, String closePeriod) {
    _open = open.toString() + ' ' + openPeriod;
    _close = close.toString() + ' ' + closePeriod;
  }

  void setOpen(int open, String openPeriod) {
    _open = open.toString() + ' ' + openPeriod;
  }

  void setClose(int close, String closePeriod) {
    _close = close.toString() + ' ' + closePeriod;
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
