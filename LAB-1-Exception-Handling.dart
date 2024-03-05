void throwErrorFunction() {
  throw Exception('Exception found!!');
}

void main() {
  try {
    throwErrorFunction();
  } catch (e) {
    print('Caught an exception: $e');
  }
}
