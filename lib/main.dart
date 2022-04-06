import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halisaha_app/model/user_player.dart';
import 'package:halisaha_app/screens/home_screen.dart';
import 'package:halisaha_app/screens/login_screen.dart';
import 'package:halisaha_app/screens/team_detail_screen.dart';
import 'package:halisaha_app/helper/shared_pref_service.dart';

import 'helper/router_generator.dart';

void main() => runApp(const MyApp());

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
