import 'package:flutter/material.dart';

class MyTeamTabBar extends StatefulWidget {
  const MyTeamTabBar({Key? key}) : super(key: key);

  @override
  State<MyTeamTabBar> createState() => _MyTeamTabBarState();
}

class _MyTeamTabBarState extends State<MyTeamTabBar>  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    _tabController=TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
      //radius: BorderRadius.vertical(top:Radius.circular(25) ,bottom: Radius.zero),
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.blueAccent,
        tabs: const [
          Tab(
            child: Text("Üyeler",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          Tab(
            child: Text("Sonuçlar",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          Tab(
            child: Text("Yorumlar",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
          ),
        ],

      ),

    );
  }
}
