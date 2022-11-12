import 'package:flutter/material.dart';
import 'dart:math';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon(
      {super.key,
      required this.firstName,
      this.surname,
      this.profilePic,
      this.isSmall});

  final String firstName;
  final String? surname;
  final Icon? profilePic;
  final bool? isSmall;

  //this has been done with an icon - needs to be changed to a jpeg/png file

  @override
  Widget build(BuildContext context) {
    //first condition: there is a profile picture
    if (profilePic != null) {
      return Container(child: profilePic);
    } else {
      //second condition: no profile picture
      return Container(
        width: isSmall != null ? 20 : 40,
        height: isSmall != null ? 20 : 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
        child: Center(
          child: surname != null
              ? Text(
                  '${firstName[0]}${surname![0]}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmall != null ? 10 : 18,
                  ),
                )
              : Text(
                  firstName[0],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmall != null ? 10 : 18,
                  ),
                ),
        ),
      );
    }
  }
}
