import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';
import 'package:halisaha_app/model/users.dart';

class ThePersonMayYouKnow extends StatefulWidget {
  final int index;
  const ThePersonMayYouKnow({Key? key, required this.index}) : super(key: key);

  @override
  State<ThePersonMayYouKnow> createState() => _ThePersonMayYouKnowState();
}

class _ThePersonMayYouKnowState extends State<ThePersonMayYouKnow> {
  @override
  Widget build(BuildContext context) {
    List<MyUser> _userList = HiveService.getData();
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
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_userList[widget.index].imageUrl),
                ),
              ),
              width: 90,
              height: 90,
            ),
            Text(
              HiveService.getData()[widget.index].name,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
