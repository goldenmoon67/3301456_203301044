import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halisaha_app/screens/widgets/home_screen_widegets/start_page_widgets/events_page.dart';
import 'package:halisaha_app/screens/widgets/home_screen_widegets/start_page_widgets/find_my_location.dart';
import 'package:halisaha_app/screens/widgets/home_screen_widegets/start_page_widgets/navigation.dart';
import 'package:halisaha_app/screens/widgets/home_screen_widegets/start_page_widgets/searching_textfield.dat.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}
double containersize = 610;
double containerMargin = 100;
String buttonStr = "Tamam";
Widget startPage = Container();
TextStyle textStyle = GoogleFonts.quicksand(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent);
double paddingText = 0;
MainAxisAlignment mainforContainer = MainAxisAlignment.center;

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const NavigationMap(),
        const Positioned(
          top: 10,
          right: 20,
          left: 20,
          child: SearchLocationTextField(),
        ),
        const Positioned(
          right: 20,
          bottom: 160,
          child: FindMyLocation(),
        ),
        Positioned(
          // top:30,
          left: 0,
          //set left 0, to start without margin at left
          right: 0,
          //set right 0 to end without margin at right
          bottom: 0,
          top: containersize,
          child: GestureDetector(
            onTap: _openEvents,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: containerMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade200,
              ),
              child: Column(
                mainAxisAlignment: mainforContainer,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(paddingText),
                    child: Center(child: Text(buttonStr, style: textStyle)),
                  ),
                  startPage,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _openEvents() {
    setState(() {
      _buildScreen();
    });
  }

  _closeEvents() {
    setState(() {
      _closeScreen();
    });
  }

  void _buildScreen() {
    containerMargin = 12;
    containersize = 120;
    mainforContainer = MainAxisAlignment.start;
    buttonStr = "Ne Arıyorsun?";
    textStyle = GoogleFonts.quicksand(
        fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blueAccent);
    paddingText = 10;
    startPage = const Padding(
      padding: EdgeInsets.all(12.0),
      child: EventsPage(),
    );
  }

  void _closeScreen() {
    containersize = 610;
    containerMargin = 100;
    buttonStr = "Tamam";
    startPage = Container();
    textStyle = GoogleFonts.quicksand(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
    paddingText = 0;
  }
}
