import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/widgets/always_use/my_scaffold.dart';
import 'package:halisaha_app/screens/widgets/find_rival_screen_widgets/create_posting_page.dart';
import 'package:halisaha_app/screens/widgets/find_rival_screen_widgets/existing_postings_page.dart';


class FindRivalScreen extends StatefulWidget {
  const FindRivalScreen({Key? key}) : super(key: key);

  @override
  State<FindRivalScreen> createState() => _FindRivalScreenState();
}

class _FindRivalScreenState extends State<FindRivalScreen>
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
      appTitle: "Rakip Bul",
      mybody: Center(
        child: Column(
          children: <Widget>[
            buildTabBar(),
            Expanded(
              // height: double.infinity,
              child: TabBarView(
                  controller: _tabController,
                  children: const [ExistingPostingsPage(), CreatePosting()]),
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
