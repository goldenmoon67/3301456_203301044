import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/firebase_services/crud_services.dart';
import 'package:halisaha_app/screens/main_screens/widgets/login_screen_widgets/form_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    CrudServices.usersFirebaseToHive();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                //decoration: BoxDecoration(color: Colors.grey),
                child: Image.asset("assets/images/login_last.png"),
              ),
              const FormTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
