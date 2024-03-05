Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data fetched successfully!';
}

void main() {
  print('Fetching data...');
  Future<String> futureData = fetchData();
  futureData.then((data) {
    print('Data received: $data');
  });
}
