import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/model/user_list.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:halisaha_app/screens/widgets/login_screen_widgets/forget_password.dart';
import 'package:halisaha_app/screens/widgets/login_screen_widgets/sign_button.dart';
import 'package:halisaha_app/screens/widgets/login_screen_widgets/title.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({Key? key}) : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  late String email;
  late String password;

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
            TitleWidget(),
            getEmailTextField(),
            getPasswordTextfield(),
            ForgetPassword(),
            getLoginButton(),
            SignButton(),
          ],
        ),
      ),
    );
  }

  Container getLoginButton() {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey.shade700,
          onPrimary: Colors.white,
        ),
        child: const Text('Giriş Yap'),
        onPressed: () {
          if (email.isEmpty || password.isEmpty) {
            return null;
          } else {
            _userLogin();
          }
        },
      ),
    );
  }

  Container getPasswordTextfield() {
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
          labelText: 'email',
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

  void _userLogin() {
    List<UserInfo> myUserList = UserList.userList;
    bool _isUser = false;
    for (int i = 0; i < myUserList.length; i++) {
      if (myUserList[i].email == email && myUserList[i].password == password) {
        UserList.userIndex=i;
        _isUser = true;
      } else {
        _isUser == false;
      }
    }

    bool _validate = _key.currentState!.validate();
    if (_validate == true && _isUser == true) {
      _key.currentState!.save();
      Navigator.pushNamed(context, '/HomeScreen');
      _key.currentState!.reset();
    }
    if (_isUser == false && _validate == true) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
      });
    }
  }
}
