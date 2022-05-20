import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/dashboard_screens/widgets/start_page_widgets/events_page.dart';
import 'package:halisaha_app/screens/dashboard_screens/widgets/start_page_widgets/find_my_location.dart';
import 'package:halisaha_app/screens/dashboard_screens/widgets/start_page_widgets/navigation.dart';
import 'package:halisaha_app/screens/dashboard_screens/widgets/start_page_widgets/searching_textfield.dat.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const NavigationMap(),
        const Positioned(
          top: 10,
          right: 20,
          left: 20,
          child: SearchLocationTextField(),
        ),
        const Positioned(
          right: 50,
          bottom: 160,
          child: FindMyLocation(),
        ),
        buildAcceptButton(context),
      ],
    );
  }

  Positioned buildAcceptButton(BuildContext context) {
    return Positioned(
      // top:30,
      left: 0,
      //set left 0, to start without margin at left
      right: 0,
      //set right 0 to end without margin at right
      bottom: 0,
      top: MediaQuery.of(context).size.height - 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
        ),
        onPressed: () {
          setState(() {
            _showEvents(context);
          });
        },
        child: const Text(
          "Lokasyonu Onayla",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }

  _showEvents(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const EventsPage();
        });
  }
}
