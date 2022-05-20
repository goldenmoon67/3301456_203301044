import 'package:flutter/material.dart';

class TeamsNearYou extends StatelessWidget {
  const TeamsNearYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/TeamDetailScreen");
        },
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Container(
                height: 130,
                //color: Colors.blueAccent,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(12),
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/tsklast.png",
                      ),
                    ),
                  ),
                  width: 100,
                  height: 160,
                ),
              ),
            ),
            const Flexible(flex:1,child: Padding(
              padding:  EdgeInsets.only(top: 1.0),
              child: Text("TSK",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            )),
          ],
        ),
      ),
    );
  }
}
