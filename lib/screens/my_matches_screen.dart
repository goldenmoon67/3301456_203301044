import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/widgets/always_use/my_scaffold.dart';
import 'package:halisaha_app/screens/widgets/find_rival_screen_widgets/sort_dropdown_button.dart';

class MyMatchesScreen extends StatelessWidget {
  const MyMatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWithAppbar(
      appTitle: "Geçmiş Maçlarım",
        mybody: Center(
      child: Column(
        children: [
          const SortDropDownButton(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _getTeamName(),
                                Text(" - "),
                                _getRivalTeam(),
                                Row(
                                  children: <Widget>[

                                    getLastGames(),
                                  ],
                                ),
                              ],
                            ),

                            _getDate(),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

  _getTeamName() {
    return Text("TSK");
  }

  _getRivalTeam() {
    return Text("GS");
  }
  Container getLastGames() {
    return Container(
      alignment: Alignment.center,
      width: 16,
      height: 16,
      child: Text(
        "G",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.green,
    );
  }

  _getDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("20/12/2022"),
        Text(" Nergis Halısaha"),
      ],
    );
  }
}
