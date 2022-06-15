import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halisaha_app/firebase_options.dart';
import 'package:halisaha_app/helper/firebase_services/firestore_user_service.dart';
import 'package:halisaha_app/helper/router_services/router_generator.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:halisaha_app/screens/main_screens/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(MyUserAdapter());
  await Hive.openBox("userbox");
  await Hive.openBox('informationbox');
  await Hive.openBox("currentUserbox");
  CrudServices.usersToHive();
  // HiveService.loginHiveonce();
  //HiveService.takeonce();
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
    CrudServices.countUsers();
    CrudServices.usersToHive();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'lifeBall',
      home: const SplashScreen(),
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}
