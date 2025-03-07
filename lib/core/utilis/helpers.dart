class Helpers {
  static void printOnlyInDebug(String message) {
    assert(() {
      print(message);
      return true;
    }());
  }
}