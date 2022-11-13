import 'package:flutter/material.dart';
import 'package:oxford_hack_flutter/ui/components/profile_icon.dart';

class NestedEventWidget extends StatelessWidget {
  const NestedEventWidget({
    super.key,
    required this.eventTitle,
    required this.username,
  });

  final String eventTitle;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(255, 120, 212, 255),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(eventTitle),
          const Spacer(),
          ProfileIcon(
            firstName: username,
            isSmall: true,
          ),
          const SizedBox(width: 5),
          Text(username),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
