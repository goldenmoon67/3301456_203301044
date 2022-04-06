import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/widgets/always_use/my_scaffold.dart';
import 'package:halisaha_app/screens/widgets/find_match_single_player_widgets/existing_posting_looking_player.dart';
import 'package:halisaha_app/screens/widgets/find_player_screen_widgets/create_posting_player.dart';
import 'package:halisaha_app/screens/widgets/find_player_screen_widgets/existing_player.dart';
import 'package:halisaha_app/screens/widgets/find_rival_screen_widgets/existing_postings_page.dart';

class FindMatchSinglePlayerScreen extends StatefulWidget {
  const FindMatchSinglePlayerScreen({Key? key}) : super(key: key);

  @override
  State<FindMatchSinglePlayerScreen> createState() => _FindMatchSinglePlayerScreenState();
}

class _FindMatchSinglePlayerScreenState extends State<FindMatchSinglePlayerScreen>with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MyScaffoldWithAppbar(
      appTitle: "Kadroda Yer Var Mı?",
      mybody: Center(
        child: Column(
          children: <Widget>[
            buildTabBar(),
            Expanded(
              // height: double.infinity,
              child: TabBarView(
                  controller: _tabController,
                  children: const [ExistingPostingLokingPlayer(), CreatePostingPlayer()]),
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
