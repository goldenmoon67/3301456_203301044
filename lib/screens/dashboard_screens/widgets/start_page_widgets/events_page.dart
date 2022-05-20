import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
         const  Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text("Ne Arıyorsun?",style: TextStyle(fontSize: 45,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 150,
            child: Row(
              children: <Widget>[
                Expanded(
                    child:
                        buildEvent("Maç Bul", Colors.red, Icons.add, context)),
                Expanded(
                  child: buildEvent("Halısa Bul", Colors.yellow,
                      Icons.gamepad_outlined, context),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: buildEvent("Futbolcu Bul", Colors.blueAccent,
                      Icons.accessibility_sharp, context),
                ),
                Expanded(
                    child: buildEvent(
                        "Rakip Bul", Colors.purpleAccent, Icons.adb, context))
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildEvent(
      String text, Color color, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (text) {
          case "Rakip Bul":
            Navigator.pushNamed(context, "/FindRivalScreen");
            break;
          case "Halısa Bul":
            Navigator.pushNamed(context, "/FindStadium");
            break;
          case "Futbolcu Bul":
            Navigator.pushNamed(context, "/FindPlayer");
            break;
            case "Maç Bul":
            Navigator.pushNamed(context, "/FindMatchSinglePlayerScreen");
            break;
          default:
            const AlertDialog(
              title: Text("Hata"),
              content: Text(
                  "Ulaşmaya Çalıştığınız sayfa şuanda kullanımda değildir."),
            );
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
