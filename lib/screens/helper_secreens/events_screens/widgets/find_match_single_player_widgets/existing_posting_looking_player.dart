import 'package:flutter/material.dart';

class ExistingPostingLokingPlayer extends StatefulWidget {
  const ExistingPostingLokingPlayer({Key? key}) : super(key: key);

  @override
  State<ExistingPostingLokingPlayer> createState() =>
      _ExistingPostingLokingPlayerState();
}

class _ExistingPostingLokingPlayerState
    extends State<ExistingPostingLokingPlayer> {
  final List<int> items = List<int>.generate(10, (int index) => index);

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
            child: buildMemberListTile(context),
          );
        },
      ),
    );
  }

  GestureDetector buildMemberListTile(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration:const  BoxDecoration(
                      shape: BoxShape.circle,
                      image:
                      DecorationImage(
                        fit: BoxFit.cover,
                          image: AssetImage("assets/images/tsklast.png",))),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'TSK',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("20:00 - 20/12/2022"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 120,
                          child: const Text(
                              "Defans oyuncusuna ihtiyacımız var. Kabul eden kişiler mesaj atsın. Araç var istediğiniz yerden sizi alırız. ")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width - 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("Nergis Halısaha"),
                            Text("7 vs 7"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
