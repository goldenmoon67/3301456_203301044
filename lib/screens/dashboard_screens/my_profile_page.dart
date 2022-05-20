import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:halisaha_app/screens/helper_secreens/my_info_screens/edit_profile_screen.dart';

import '../../../constants/login_constants.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    MyUser _currentUser = HiveService.readCurrentUser();
    return Column(
      children: <Widget>[
        buildHeader(context),
        Text(_currentUser.name.toString(),
            style: LoginConstants.loginTextStyle),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          child: const Text(
            "Profili Düzenle",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()))
                .then(
              (value) {
                setState(() {});
              },
            );
          },
        ),
        getEvents(),
      ],
    );
  }

  Expanded getEvents() {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          buildEvent(
            "Takımlarım",
            Colors.red.shade400,
            Icons.add_to_home_screen_rounded,
            context,
          ),
          buildEvent(
            "Maçlarım",
            Colors.orange.shade400,
            Icons.h_mobiledata_sharp,
            context,
          ),
          buildEvent(
            "Özelliklerim",
            Colors.blue.shade400,
            Icons.analytics_outlined,
            context,
          ),
          buildEvent(
            "Başarılarım",
            Colors.lightGreenAccent.shade400,
            Icons.gamepad,
            context,
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
          case "Takımlarım":
            Navigator.pushNamed(context, "/MyTeamsScreen");
            break;
          case "Özelliklerim":
            Navigator.pushNamed(context, "/MyFeaturesScreen");
            break;
          case "Maçlarım":
            Navigator.pushNamed(context, "/MyMatchesScreen");
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
        color: color,
      ),
    );
  }

  Stack buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            "assets/images/back_myProfile.jpg",
            fit: BoxFit.contain,
            height: 300,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 150,
          right: 130,
          child: Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 4, color: Theme.of(context).scaffoldBackgroundColor),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 10))
              ],
              shape: BoxShape.circle,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/mrc.jpg")),
            ),
          ),
        ),
      ],
    );
  }
}
