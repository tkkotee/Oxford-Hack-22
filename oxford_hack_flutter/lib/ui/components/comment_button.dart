import 'package:flutter/material.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 214, 214, 214),
        ),
        child: const Center(child: Text('Comment')),
      ),
    );
  }
}