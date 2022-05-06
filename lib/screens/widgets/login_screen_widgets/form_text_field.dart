import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart' as prefix;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/firebase_services/authentication_service.dart';
import 'package:halisaha_app/helper/hive_service.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:halisaha_app/screens/widgets/login_screen_widgets/forget_password.dart';
import 'package:halisaha_app/screens/widgets/login_screen_widgets/sign_button.dart';
import 'package:halisaha_app/screens/widgets/login_screen_widgets/sign_in_with_google.dart';
import 'package:halisaha_app/screens/widgets/login_screen_widgets/title.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({Key? key}) : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  late String name = "";
  late String email = "";
  late String password = "";
  bool userResultFirebase = false;
  final snackbarMessage = SnackBar(
    content: const Text('Hatali email veya sifre!'),
    backgroundColor: Colors.red.shade400,
  );
  late String versionString;
  final _key = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            const TitleWidget(),
            getEmailTextField(),
            passwordTextField(),
            const ForgetPassword(),
            getLoginButton(),
            const SingInWithGoogle(),
            const SignButton(),
          ],
        ),
      ),
    );
  }

  Container getLoginButton() {
    return Container(
      height: 55,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: const BorderSide(color: Colors.blueAccent),
              ),
            )),
        child: const Text('Giriş Yap'),
        onPressed: () async {
          if (email.isEmpty || password.isEmpty) {
            return;
          } else {
            AuthenticationService.loginWithEmailandPassword(email, password);
            AuthenticationService.userLog(context);
          }
        },
      ),
    );
  }

  Container passwordTextField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        decoration: const InputDecoration(
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          labelText: 'Şifre',
        ),
        onChanged: (value) {
          password = value.toString();
        },
        validator: (value) {
          if (value!.length < 6) {
            return "Şifre en az 6 karakter olmalı";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Container getEmailTextField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        decoration: const InputDecoration(
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          labelText: 'Email',
        ),
        onChanged: (value) {
          EmailValidator.validate(value);
          email = value.toString();
        },
        validator: (value) => validateEmail(value),
      ),
    );
  }

  validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Lütfen geçerli email giriniz.';
    } else {
      return null;
    }
  }

//hive database login query
  void _userLogin() {
    List<MyUser> myUserList = HiveService.getData();
    bool _isUser = false;
    for (int i = 0; i < myUserList.length; i++) {
      if (myUserList[i].email == email && myUserList[i].password == password) {
        HiveService.userIndex = i;
        _isUser = true;
      } else {
        _isUser == false;
      }
    }

    bool _validate = _key.currentState!.validate();
    if ((_validate == true && _isUser == true) || userResultFirebase == true) {
      _key.currentState!.save();
      Navigator.pushNamed(context, '/HomeScreen');
      _key.currentState!.reset();
    }
    if (userResultFirebase == false) {
      //_isUser == false && _validate == true && userResultFirebase == false) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
      });
    } else {
      CircularProgressIndicator();
    }
  }
}
