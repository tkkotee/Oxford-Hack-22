import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/comment_button.dart';
import 'package:oxford_hack_flutter/ui/components/join_button.dart';
import 'package:oxford_hack_flutter/ui/components/profile_icon.dart';

class JoinedBy extends StatelessWidget {
  const JoinedBy({super.key, required this.friends, required this.isOwnEvent,});

  final List<List<String>> friends;
  final bool isOwnEvent;

  @override
  Widget build(BuildContext context) {
      return Row(
        children: [
          friends.isNotEmpty ? const Text('Joined by: ') : const SizedBox.shrink(),
          ...friends
              .map(
                (friend) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: ProfileIcon(
                    firstName: friend[0],
                    surname: friend[1],
                    isSmall: true,
                  ),
                ),
              )
              .toList(),
          const Spacer(),
          isOwnEvent ? const SizedBox.shrink() : const JoinButton(),
          const SizedBox(width: 5),
          const CommentButton(),
        ],
      );
    }
  }
