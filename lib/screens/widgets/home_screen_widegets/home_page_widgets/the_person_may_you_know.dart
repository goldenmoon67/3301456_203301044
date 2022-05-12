import 'package:flutter/material.dart';

class ThePersonMayYouKnow extends StatefulWidget {
  const ThePersonMayYouKnow({Key? key}) : super(key: key);

  @override
  State<ThePersonMayYouKnow> createState() => _ThePersonMayYouKnowState();
}

class _ThePersonMayYouKnowState extends State<ThePersonMayYouKnow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      margin: const EdgeInsets.only(right: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/PlayerDetailScreen");
        },
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 10))
                ],
                shape: BoxShape.circle,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/mrc.jpg",
                  ),
                ),
              ),
              width: 90,
              height: 90,
            ),
            Text(
              "Mirac Altinay",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
