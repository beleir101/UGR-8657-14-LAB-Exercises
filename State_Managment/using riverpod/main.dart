import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './riverpod.dart';
import './Todo.dart';

void main() {
  runApp(const ProviderScope(child: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDoApp",
      home: MyApp(),
    );
  }
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Your current Todos")),
      body: ref.watch(ToDoProvider).when(
        data: (data) {
          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  title: Text('${data[index].id}'),
                  subtitle: Text('${data[index].title}'),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 5),
          );
        },
        error: (error, StackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}