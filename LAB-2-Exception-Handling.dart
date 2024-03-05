void throwErrorFunction() {
  int result = int.parse('abebe');
}

void main() {
  try {
    throwErrorFunction();
  } catch (e) {
    if (e is FormatException) {
      print('Caught a FormatException: $e');
    } else {
      print('Caught an exception: $e');
    }
  }
}
