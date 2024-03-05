void main() {
  List<int> numbers = [1, 2, 3, 3, 2, 1, 10, 2, 5, 3];

  double average(List<int> n) {
    int s = 0;
    for (int i = 0; i < n.length; i++) {
      s += n[i];
    }
    return s / n.length;
  }

  print(average(numbers));
}
