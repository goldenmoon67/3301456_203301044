import 'package:flutter/material.dart';

class PlayerTeamsPage extends StatefulWidget {
  const PlayerTeamsPage({Key? key}) : super(key: key);

  @override
  State<PlayerTeamsPage> createState() => _PlayerTeamsPageState();
}

class _PlayerTeamsPageState extends State<PlayerTeamsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => const TeamCard(),
    );
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            left: 100,
            top: 30,
            child: Container(
              height: 120,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-10, 10),
                    color: Colors.grey.shade400,
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      "Türk Sporcu Kuvvetleri",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Chip(
                          label: Text(
                            "Ereğli/Zonguldak",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Chip(
                          label: Text(
                            "14 Üye",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              height: 170,
              width: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/tsklast.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
