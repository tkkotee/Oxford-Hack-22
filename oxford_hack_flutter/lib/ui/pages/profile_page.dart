import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 200,
              color: Colors.transparent,
            ),
            Container(
              height: 150,
              color: Colors.green,
            ),
            Positioned(
              left: 50,
              top: 100,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                    border: Border.all(color: Colors.white, width: 5)),
              ),
            ),
            const Positioned(
              left: 150,
              top: 150,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text('Tarn Koteeswarn', textScaleFactor: 1.5),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 219, 219, 219),
                  Color.fromARGB(255, 211, 211, 211)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              ),
               boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,10),
                      child: Text('Followers'),
                    ),
                    Text('52', textScaleFactor: 2,)
                  ],
                ),
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,10),
                      child: Text('Following'),
                    ),
                    Text('39', textScaleFactor: 2)
                  ],
                ),
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,10),
                      child: Text('Events'),
                    ),
                    Text('21', textScaleFactor: 2)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
