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
      height: (30 * comments.length).toDouble(),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 2,
            height: (30 * (comments.length - 1)).toDouble() + 16,
            color: Colors.black,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: comments
                .map(
                  (comment) => Container(
                    height: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 5,
                          height: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(comment),
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
