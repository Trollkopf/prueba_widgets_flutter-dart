import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Like',
      color: Colors.white,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Like'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _corazon = Icon(Icons.favorite, color: Colors.white);
  bool _likeBool = true;

  void _likeThis() {
    setState(() {
      if (_likeBool) {
        _corazon = Icon(Icons.favorite_border, color: Colors.white);
        _likeBool = false;
      } else {
        _corazon = Icon(Icons.favorite, color: Colors.white);
        _likeBool = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[IconButton(onPressed: _likeThis, icon: _corazon)],
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _likeThis,
        backgroundColor: Colors.red,
        child: _corazon,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
