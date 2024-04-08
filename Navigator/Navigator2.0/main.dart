import 'package:flutter/material.dart';
import 'course.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CourseApp(),
    );
  }
}

class CourseListScreen extends StatelessWidget {
  final List<Course> courses;
  final ValueChanged<Course> onTapped;
  const CourseListScreen({required this.courses, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Course List"),),
      body: ListView(
        children: [for (var course in courses)
        ListTile(title: Text(course.title),
        subtitle: Text(course.code),
        onTap: ()=>onTapped(course),)],
      ),
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  final Course course;
  const CourseDetailsScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title),),
      body: Center(child: Column(children: [
        Text(course.title),
        Text(course.code),
        Text(course.description),
      ],),),

    );
  }
}

class CourseApp extends StatefulWidget {
  const CourseApp({super.key});

  @override
  State<CourseApp> createState() => _CourseAppState();
}

class _CourseAppState extends State<CourseApp> {

  Course? _selectedCourse;

  void _tabHandler(Course course){
    setState(() {
      _selectedCourse = course;
    });
  }
  List<Course> courses = [
    Course(code: "SiTE-001", title: "Introduction To Programming", description: "Computer Organization, Architecture, Programming"),
    Course(code: "Site-002", title: "Introduction To AI", description: "Fundamentals, graph, datastructure"),
    Course(code: "Site-003", title: "Fundamental of ICT", description: "School, ICT")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        onPopPage: (route, result) {
          if (!route.didPop(result)){
            return false;
          }
          setState(() {
            _selectedCourse = null;
          });
          return true;
        },
        pages: [MaterialPage(
          key: const ValueKey("CourseListScreen"),
          child: CourseListScreen(courses: courses, onTapped: _tabHandler),
          ),
          if (_selectedCourse != null)
          MaterialPage(
            key: ValueKey(_selectedCourse),
            child: CourseDetailsScreen(course: _selectedCourse!,))
          ],),
    );
  }
}
