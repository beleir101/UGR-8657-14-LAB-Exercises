void learningExceptions() {
  try {
    print('WAITT..');
    throw Exception('An error occurred.');
  } catch (e) {
    print('Exception caught: $e');
  } finally {
    print('Regardless of the erorr HELLO YOU');
  }
}

void main() {
  learningExceptions();
}
