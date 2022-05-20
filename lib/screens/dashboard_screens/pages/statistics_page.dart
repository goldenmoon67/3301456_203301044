import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              color: Colors.blue,
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text("Liderlik Sıralaması",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 24,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            getTeamInfo(context),
                            Row(
                              children: [
                                Row(
                                  children: <Widget>[
                                    getLastGames(),
                                    getLastGames(),
                                    getLastGames(),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                getTeamPoint(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Text getTeamPoint() {
    return const Text(
      "9",
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  GestureDetector getTeamInfo(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,"/TeamDetailScreen");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration:const  BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/tsklast.png"),
              ),
            ),
            //child: Icon(Icons.person),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text("Türk Sporcu Kuvvetleri"),
        ],
      ),
    );
  }

  Container getLastGames() {
    return Container(
      alignment: Alignment.center,
      width: 16,
      height: 16,
      child: Text(
        "G",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.green,
    );
  }
}
