void main() {
  List<int> numbers = [1, 2, 3, 4, 4, 5, 6, 6, 7, 8, 8, 9];

  List<int> removeDuplicates(List<int> list) {
    List<int> uniqueList = [];
    for (int item in list) {
      if (!uniqueList.contains(item)) {
        uniqueList.add(item);
      }
    }
    return uniqueList;
  }

  print(removeDuplicates(numbers));
}
