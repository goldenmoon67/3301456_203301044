import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page_widgets/info_list.dart';
import 'home_page_widgets/searching_textfield.dart';
import 'home_page_widgets/teams_near_you.dart';
import 'home_page_widgets/the_person_may_you_know.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset("assets/images/images.jpg",
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width - 1,
                  height: MediaQuery.of(context).size.height - 10),
            ),
            Positioned(
              top: 20,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const SearchingTextFieldForHomePage(),
                    buildListViewBuilder(context, const ThePersonMayYouKnow(),
                        "Yakınınki Kullanıcılar"),
                    const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child:  Text("Nasıl Kullanılır?"),
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
          Text(title),
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
