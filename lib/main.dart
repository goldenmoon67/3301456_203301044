import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:halisaha_app/screens/login_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'helper/router_generator.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserInfoAdapter());
  await Hive.openBox("users");
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'lifeBall',
      home:const   LoginScreen(),
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }

}
