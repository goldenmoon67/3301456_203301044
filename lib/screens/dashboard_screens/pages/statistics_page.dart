import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/fetch_leaderboard/fetch_team_results_service.dart';
import 'package:halisaha_app/model/team_result.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late Future<List<TeamResult>> teamList;
  @override
  void initState() {
    teamList = FetchTeamResult.readFromJson(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Row(
                  children: [
                    const Text(
                      "Liderlik Sıralaması",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        _actionSheet();
                      },
                      color: Colors.white,
                      icon: const Icon(
                        Icons.bar_chart_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<TeamResult>>(
              future: teamList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<TeamResult> item = snapshot.data!;
                  return ListView.builder(
                    itemCount: item.length,
                    itemBuilder: ((context, index) => Column(
                          children: [
                            SizedBox(
                              height: 24,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    getTeamInfo(
                                      context,
                                      item,
                                      index,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            getLastGames(),
                                            getLastGames(),
                                            getLastGames(),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        getTeamPoint(item, index),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(),
                          ],
                        )),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Text getTeamPoint(List<TeamResult> item, int index) {
    return Text(
      item[index].p.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  GestureDetector getTeamInfo(
      BuildContext context, List<TeamResult> item, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/TeamDetailScreen");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/tsklast.png"),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(item[index].takim.toString()),
        ],
      ),
    );
  }

  Container getLastGames() {
    return Container(
      alignment: Alignment.center,
      width: 16,
      height: 16,
      child: const Text(
        "G",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.green,
    );
  }

  _actionSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return PieChart(
            PieChartData(sections: [
              PieChartSectionData(color: Colors.red, value: 56, title: "TS"),
              PieChartSectionData(color: Colors.yellow, value: 33, title: "FB"),
              PieChartSectionData(color: Colors.grey, value: 28, title: "KON"),
            ]),
            swapAnimationDuration:
                const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          );
        });
  }
}
