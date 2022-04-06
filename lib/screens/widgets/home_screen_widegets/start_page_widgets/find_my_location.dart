import 'package:flutter/material.dart';

class FindMyLocation extends StatelessWidget {
  const FindMyLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.blueAccent,
        ),
        child: IconButton(
          icon: const Icon(Icons.navigation_rounded),
          onPressed: () {},
          color: Colors.white,
        ),);
  }
}
