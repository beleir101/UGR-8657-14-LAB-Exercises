import 'package:flutter/foundation.dart';
import 'Todo.dart';
import 'service.dart';
import 'expanded_todo.dart';

class TodoProvider extends ChangeNotifier {
  final TodoService _todoService = TodoService();
  List<Todo> _todos = [];
  TodoDetail? _currentTodoDetail;

  List<Todo> get todos => _todos;
  TodoDetail? get currentTodoDetail => _currentTodoDetail;

  Future<void> fetchTodos() async {
    try {
      _todos = await _todoService.fetchTodos();
      notifyListeners();
    } catch (e) {
      print('Error fetching todos: $e');
    }
  }

  Future<void> fetchTodoDetail(int id) async {
    try {
      _currentTodoDetail = await _todoService.fetchTodoDetail(id);
      notifyListeners();
    } catch (e) {
      print('Error fetching todo detail: $e');
    }
  }
}