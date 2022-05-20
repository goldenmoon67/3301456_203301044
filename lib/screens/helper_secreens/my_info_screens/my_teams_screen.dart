import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/helper_secreens/detail_screens/widgets/player_detail_screen_widgets/player_teams_page.dart';
import 'package:halisaha_app/screens/helper_secreens/widgets/always_use/my_scaffold.dart';

class MyTeamsScreen extends StatelessWidget {
  const MyTeamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWithAppbar(
      appTitle: "Takımlarım",
      mybody: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.blueAccent,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/abc.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 3,
                      right: 10,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Yeni Takım Ekle"),
                              Icon(Icons.add_circle)
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),

                //for scrollable
                itemCount: 4,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TeamCard(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
