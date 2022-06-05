import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/dashboard_screens/pages/statistics_page.dart';
import 'package:halisaha_app/screens/helper_secreens/detail_screens/widgets/team_details_widgets/team_members.dart';
import 'package:halisaha_app/screens/helper_secreens/detail_screens/widgets/team_details_widgets/team_profile.dart';

class TeamDetailScreen extends StatefulWidget {
  const TeamDetailScreen({Key? key}) : super(key: key);

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 550,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/back_myProfile.jpg",
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(32),
                      child: const Center(
                        child: TeamProfile(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.blueAccent,
                  tabs: const [
                    Tab(
                      child: Text(
                        "Üyeler",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Sonuçlar",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Yorumlar",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 400,
                    child: TabBarView(controller: _tabController, children: [
                      TeamMembers(),
                      const StatisticsPage(),
                      TeamMembers()
                    ]),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
