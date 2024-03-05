void main() {
  List<int> numbers = [10, 12, 1, 3, 5, 100, 2, 3, 9, 10, 101, 4];
  int maximum(List<int> n) {
    int maxim = 0;
    for (int i = 0; i < n.length; i++) {
      if (n[i] > maxim) {
        maxim = n[i];
      }
    }
    return maxim;
  }

  print(maximum(numbers));
}
