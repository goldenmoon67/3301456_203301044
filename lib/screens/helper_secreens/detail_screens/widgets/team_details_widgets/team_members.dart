import 'package:flutter/material.dart';

class TeamMembers extends StatelessWidget {
  final List<int> items = List<int>.generate(10, (int index) => index);

  TeamMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        //for scrollable
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            width: double.infinity,
            height: 80,
            child: buildMemberListTile(context),
          );
        },
      ),
    );
  }

  GestureDetector buildMemberListTile(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/PlayerDetailScreen");
      },
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration:const  BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage("assets/images/mrc.jpg"))),
        ),
        subtitle:const Text("Orta Saha"),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
             Text(
              "playerName",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
