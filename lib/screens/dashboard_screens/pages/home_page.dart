import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/dashboard_screens/widgets/home_page_widgets/info_list.dart';
import 'package:halisaha_app/screens/dashboard_screens/widgets/home_page_widgets/searching_textfield.dart';
import 'package:halisaha_app/screens/dashboard_screens/widgets/home_page_widgets/teams_near_you.dart';
import 'package:halisaha_app/screens/dashboard_screens/widgets/home_page_widgets/the_person_may_you_know.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              child: Image.asset("assets/images/home.jpg",
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width - 1,
                  height: MediaQuery.of(context).size.height + 10),
            ),
            Positioned(
              top: 20,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0, right: 8, left: 8),
                child: Column(
                  children: <Widget>[
                    const SearchingTextFieldForHomePage(),
                    buildListViewBuilder(context, const ThePersonMayYouKnow(),
                        "Yakınındaki Kullanıcılar"),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Nasıl Kullanılır?",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const InfoList(),
                    buildListViewBuilder(
                        context, const TeamsNearYou(), "Yakınındaki Takımlar"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildListViewBuilder(BuildContext context, Widget listView, String title) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => listView),
          ),
        ],
      ),
    );
  }
}
