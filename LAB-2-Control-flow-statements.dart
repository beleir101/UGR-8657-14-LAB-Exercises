void main() {
  int first = 1;
  int second = 0;
  for (int i = 0; i < 10; i++) {
    if (i == 0) {
      print(0);
    } else if (i == 1) {
      print(1);
    } else {
      int ans = first + second;
      print(ans);
      second = first;
      first = ans;
    }
  }
}
