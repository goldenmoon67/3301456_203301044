import 'package:flutter/material.dart';

class NavigationMap extends StatelessWidget {
  const NavigationMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/maplast.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
