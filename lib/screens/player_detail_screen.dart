import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/widgets/always_use/my_scaffold.dart';
import 'package:halisaha_app/screens/widgets/player_detail_screen_widgets/player_teams_page.dart';

class PlayerDetailScreen extends StatefulWidget {
  const PlayerDetailScreen({Key? key}) : super(key: key);

  @override
  State<PlayerDetailScreen> createState() => _PlayerDetailScreenState();
}

class _PlayerDetailScreenState extends State<PlayerDetailScreen>
    with SingleTickerProviderStateMixin {
  TextStyle textStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWithAppbar(
      appTitle: "Mirac Altinay",
      mybody: Stack(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            height: 500,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )),
            child: Container(
              margin: EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  Flexible(flex: 1, child: buildTabBar()),
                  Flexible(
                    flex: 7,
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        PlayerTeamsPage(),
                        PlayerTeamsPage(),
                        PlayerTeamsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/back_myProfile.jpg",
                  fit: BoxFit.fill,
                  height: 250,
                  width: double.infinity,
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: const <Widget>[
                          Text(
                            "",
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width - 10,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(36.0),
                            child: Container(
                              margin: EdgeInsets.only(top: 70),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "24 Yaş",
                                    style: textStyle,
                                  ),
                                  Text(
                                    "Orta Saha",
                                    style: textStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 170,
                              width: 150,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage("assets/images/mrc.jpg"),
                                ),
                              ),
                            ),
                          ), //child: Image.asset("assets/images/mrc.jpg"))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.blueAccent,
      tabs: const [
        Tab(
          child: Text(
            "Takımları",
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "Özellikleri",
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "Maçları",
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
