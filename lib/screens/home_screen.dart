import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/widgets/home_screen_widegets/home_page.dart';
import 'package:halisaha_app/screens/widgets/home_screen_widegets/start_page.dart';
import 'package:halisaha_app/screens/widgets/home_screen_widegets/messages_page.dart';
import 'package:halisaha_app/screens/widgets/home_screen_widegets/my_profile_page.dart';
import 'package:halisaha_app/screens/widgets/home_screen_widegets/statistics_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                FirebaseAuth aut = FirebaseAuth.instance;
                aut.signOut();
              },
              icon: const Icon(
                Icons.search,
              ),
              color: Colors.grey,
            ),
          ),
        ],
        title: const Text(
          'lifeBall',
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
      body: TabBarView(controller: _tabController, children: const <Widget>[
        HomePage(),
        StatisticsPage(),
        StartPage(),
        MessagesPage(),
        MyProfilePage(),
      ]),
      bottomNavigationBar: buildNavigationBar(),
    );
  }

  Widget buildNavigationBar() {
    return Material(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(25), bottom: Radius.zero),
      color: Colors.white12,
      child: TabBar(
        indicatorColor: Colors.blueAccent,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        padding: EdgeInsets.only(
          bottom: 5,
        ),
        controller: _tabController,
        tabs: [
          Tab(
            icon: Icon(
              Icons.home_filled,
              color:
                  _tabController.index == 0 ? Colors.blueAccent : Colors.grey,
              size: 30,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.analytics_outlined,
              size: 30,
              color:
                  _tabController.index == 1 ? Colors.blueAccent : Colors.grey,
            ),
          ),
          Tab(
            height: 60,
            icon: Icon(
              Icons.sports_soccer,
              size: 58,
              color:
                  _tabController.index == 2 ? Colors.blueAccent : Colors.grey,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.message,
              size: 30,
              color:
                  _tabController.index == 3 ? Colors.blueAccent : Colors.grey,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.person,
              size: 30,
              color:
                  _tabController.index == 4 ? Colors.blueAccent : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
