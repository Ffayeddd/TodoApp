import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allTodos;
  final int allCompleted;
  const Counter({Key? key, required this.allTodos, required this.allCompleted})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text("$allCompleted/$allTodos",
          style: TextStyle(
              fontSize: 44,
              color: allCompleted == allTodos ? Colors.green : Colors.white,
              fontWeight: FontWeight.bold)),
    );
  }
}
