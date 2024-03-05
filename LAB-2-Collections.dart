void main() {
  Map<String, int> Age = {
    "abeni": 20,
    "Alem": 35,
    "Aster": 90,
    "brook": 25,
    "Fasil": 30
  };
  void keys(Map<String, int> n) {
    int counter = 1;
    for (var element in n.keys) {
      print("Student $counter name is $element");
      counter++;
    }
    counter = 1;
    for (var element in n.values) {
      print("Student $counter age is $element");
      counter++;
    }
  }

  keys(Age);
}
