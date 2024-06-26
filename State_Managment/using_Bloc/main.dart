import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// Define the Post model
class Post {
  final int id;
  final String title;
  final String completed;
  final int UserId;


  Post({required this.id, required this.title, required this.completed, required this.UserId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      UserId: json['userId'],
      title: json['title'],
      completed: json['completed']
    );
  }
}

abstract class PostEvent {}

class FetchPosts extends PostEvent {}
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded({required this.posts});
}

class PostError extends PostState {}


class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
        print(response.statusCode);
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body);
          final List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
          emit(PostLoaded(posts: posts));
        } else {
          emit(PostError());
        }
      } catch (e) {
        emit(PostError());
      }
    });
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: BlocProvider(
        create: (context) => PostBloc()..add(FetchPosts()),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('current todos'),
        backgroundColor: Colors.green[200],
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial || state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.separated(
              separatorBuilder: ((context, index)=> const SizedBox(height: 5)),
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  tileColor: Colors.cyan[100],
                  title: Text(post.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsPage(post: post),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}

class PostDetailsPage extends StatelessWidget {
  final Post post;

  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(post.title*10),
      ),
    );
  }
}