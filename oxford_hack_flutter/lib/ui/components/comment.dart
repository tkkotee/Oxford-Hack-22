import 'package:flutter/material.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    super.key,
    required this.comments,
  });

  final List<String> comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 15,
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black))),
          ),
          SizedBox(width: 10),
          Center(child: Text('commentText'))
        ],
      ),
    );
  }
}
