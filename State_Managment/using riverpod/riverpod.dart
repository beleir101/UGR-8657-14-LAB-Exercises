import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import './Todo.dart';
import "dart:convert";

List<Todo> current = [];

final ToDoProvider = FutureProvider<List<Todo>>((ref) {
  const url = "https://jsonplaceholder.typicode.com/todos";
  return http.get(Uri.parse(url)).then((response) {
    
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      current = parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
      return current.sublist(0, 6);
    } else {
      throw Exception('Failed to load todos');
    }
  });
});

 Future<void> editItem(int id, String newTitle, String newBody) async {
    final response = await http.put(
      
      Uri.parse("https://jsonplaceholder.typicode.com/todos$id"),
      body: json.encode({'title': newTitle, 'body': newBody}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final updatedItemIndex = current.indexWhere((item) => item.id == id);
      if (updatedItemIndex != -1) {
        current[updatedItemIndex] = Todo(
          id: id,
          title: newTitle,
          completed: false
        );
      }
    } else {
      throw Exception('Failed to update item');
    }
  }

