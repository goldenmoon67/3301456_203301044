import 'package:flutter/material.dart';

class TeamResults extends StatelessWidget {
  const TeamResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.builder(scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: 16,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 40,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Tsk"),
                          Text(" - "),
                          Text("KerimlerSk"),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 16,
                      height: 16,
                      child: Text("G",style: TextStyle(color: Colors.white),),
                      color: Colors.green,

                    ),
                  ],
                ),
              ),
            );
          },
        ),

    );
  }
}
