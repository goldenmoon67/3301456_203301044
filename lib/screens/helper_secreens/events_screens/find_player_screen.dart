import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/helper_secreens/events_screens/widgets/find_player_screen_widgets/create_posting_player.dart';
import 'package:halisaha_app/screens/helper_secreens/events_screens/widgets/find_player_screen_widgets/existing_player.dart';
import 'package:halisaha_app/screens/helper_secreens/widgets/always_use/my_scaffold.dart';

class FindPlayerScreen extends StatefulWidget {
  const FindPlayerScreen({Key? key}) : super(key: key);

  @override
  State<FindPlayerScreen> createState() => _FindPlayerScreenState();
}

class _FindPlayerScreenState extends State<FindPlayerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWithAppbar(
      appTitle: "Futbolcu Bul",
      mybody: Center(
        child: Column(
          children: <Widget>[
            buildTabBar(),
            Expanded(
              // height: double.infinity,
              child: TabBarView(
                  controller: _tabController,
                  children: const [ExistingPlayer(), CreatePostingPlayer()]),
            ),
          ],
        ),
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
            "İlan bul",
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "İlan oluştur",
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
