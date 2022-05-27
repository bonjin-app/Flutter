import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatefulWidget {
  const CustomScrollViewScreen({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewScreen> createState() => _CustomScrollViewScreenState();
}

class _CustomScrollViewScreenState extends State<CustomScrollViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('test')
        ],
      ),
    );
  }
}
