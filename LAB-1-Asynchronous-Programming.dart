Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data fetched successfully!';
}

void fetchDataDemo() async {
  print('Fetching in progres...');
  String data = await fetchData();
  print('Data received: $data');
}

void main() {
  fetchDataDemo();
}
