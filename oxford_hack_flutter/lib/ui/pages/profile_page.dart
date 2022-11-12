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
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 100,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black.withOpacity(0.5)),
                bottom: BorderSide(color: Colors.black.withOpacity(0.5)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('Followers'),
                    Text(
                      '52',
                      textScaleFactor: 2,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('Following'),
                    Text('39', textScaleFactor: 2)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('Events'),
                    Text('21', textScaleFactor: 2)
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'This Month',
                    textScaleFactor: 1.5,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Here's your most visited places this month")
                ],
              )),
        ),
      ],
    );
  }
}
