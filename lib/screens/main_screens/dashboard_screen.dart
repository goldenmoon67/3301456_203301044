import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';

import 'package:halisaha_app/screens/dashboard_screens/pages/my_profile_page.dart';
import 'package:halisaha_app/screens/dashboard_screens/pages/home_page.dart';
import 'package:halisaha_app/screens/dashboard_screens/pages/messages_page.dart';
import 'package:halisaha_app/screens/dashboard_screens/pages/start_page.dart';
import 'package:halisaha_app/screens/dashboard_screens/pages/statistics_page.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
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
                HiveService.logOutHive();
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
          const BorderRadius.vertical(top: Radius.circular(25), bottom: Radius.zero),
      color: Colors.white12,
      child: TabBar(
        indicatorColor: Colors.blueAccent,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        padding: const EdgeInsets.only(
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
