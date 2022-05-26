import 'package:flutter/material.dart';

class InfoList extends StatefulWidget {
  const InfoList({Key? key}) : super(key: key);

  @override
  State<InfoList> createState() => _InfoListState();
}

class _InfoListState extends State<InfoList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextStyle textStyle = const TextStyle(color: Colors.white);
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
    return SizedBox(
      height: 200,
      width: 300,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                _getContainer1(),
                _getContainer2(),
                _getContainer3()
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.blueAccent,
            tabs: const [
              Tab(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getContainer1() {
    return Container(
      height: 200,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "Halısaha mı arıyorsun?",
                  style: textStyle,
                )),
                Expanded(child: Text("Takımın mı eksik?", style: textStyle)),
                Expanded(child: Text("Rakip mi arıyorsun?", style: textStyle)),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("İlanları Gör")))
              ],
            ),
          ),
          Expanded(child: Image.asset("assets/images/abc.png")),
        ],
      ),
    );
  }

  _getContainer2() {
    return Container(
      height: 200,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child:
                  Text("Arkadaşlarını Uygulamaya davet et", style: textStyle),
            ),
            Expanded(
              child: Text("Takımı Güçlendir", style: textStyle),
            ),
            Expanded(
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Davet Et")))
          ],
        ),
      ),
    );
  }

  _getContainer3() {
    return Container(
      height: 200,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.teal.shade300),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text("Sana en yakın ilanlar için konumunu aç",
                  style: textStyle),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 95,
                    width: 45,
                    child: Text(
                        "Konum bilginle yakınındaki halısahaları, futbolcuları, takımları bulabilirsin.",
                        style: textStyle),
                  ),
                ),
                Expanded(child: Image.asset("assets/images/abc.png"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
