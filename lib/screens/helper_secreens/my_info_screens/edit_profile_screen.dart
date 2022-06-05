import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/firebase_services/firestore_user_service.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:halisaha_app/screens/helper_secreens/my_info_screens/widgets/edit_profile_widgets/edit_photo_screen.dart';
import 'package:halisaha_app/screens/helper_secreens/widgets/always_use/my_scaffold.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    with TickerProviderStateMixin {
  final snackbarMessage = SnackBar(
    content: const Text('Başarı ile düzenlendi!'),
    backgroundColor: Colors.green.shade400,
  );
  late MyUser myUser = HiveService.readCurrentUser();

  late String name;
  late String email;
  late String password;
  late String city;
  late String town;
  bool showPassword = false;

  late TextEditingController _emailController;
  //late TextEditingController _passwordController;
  late TextEditingController _cityController;
  late TextEditingController _townController;
  late TextEditingController _neighborhoodController;
  late TextEditingController _nameController;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    name = myUser.name;
    email = myUser.email;
    password = myUser.password;
    city = myUser.city;
    town = myUser.town;
    // _passwordController = TextEditingController();
    _cityController = TextEditingController();
    _townController = TextEditingController();
    _neighborhoodController = TextEditingController();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _cityController.dispose();
    _townController.dispose();
    _neighborhoodController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWithAppbar(
      appTitle: "Profili Düzenle",
      mybody: Container(
        padding: const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: buildProfilePhoto(context),
              ),
              const SizedBox(
                height: 35,
              ),
              getTextfield(
                  "Ad",
                  "Adınızı giriniz",
                  false, //character visibilitty
                  _nameController,
                  TextInputType.text,
                  myUser.name),
              getEmailTextField(myUser.email),
              getPasswordTextfield(myUser.password),
              getTextfield(
                  "Şehir",
                  "Bulunduğunuz Şehir",
                  false, //character visibilitty
                  _cityController,
                  TextInputType.text,
                  myUser.city),
              getTextfield(
                  "İlçe",
                  "Bulunduğunuz İlçe",
                  false, //character visibilitty
                  _townController,
                  TextInputType.text,
                  myUser.town),
              buildButtons()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(16)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('İPTAL',
                style: TextStyle(
                    fontSize: 14, letterSpacing: 2.2, color: Colors.black)),
          ),
          ElevatedButton(
            onPressed: () {
              CrudServices.updateUser(
                email: email,
                name: name,
                password: password,
                city: city,
                town: town,
              );
              _onLoading();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(16)),
            ),
            child: const Text(
              "KAYDET",
              style: TextStyle(
                  fontSize: 14, letterSpacing: 2.2, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
    Future.delayed(const Duration(milliseconds: 1000), () {
      ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
      Navigator.pop(context); //pop dialog
      Navigator.pop(context);
    });
  }

  Container getPasswordTextfield(String name) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: true,
        initialValue: name,
        //controller: _passwordController,
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

  Container getEmailTextField(String name) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        initialValue: name.toString(),
        //   controller: _emailController,
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

  Container getTextfield(
      String labelText,
      String placeholder,
      bool isPasswordTextField,
      TextEditingController controller,
      TextInputType? keyboardType,
      String name) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: isPasswordTextField,
        keyboardType: keyboardType,
        initialValue: name,
        //controller: controller,
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          labelText: labelText,
          hintText: placeholder,
        ),
        onChanged: (
          value,
        ) {
          _setInfo(value, labelText);
        },
        validator: (value) {
          if (labelText == "Ad" && value!.length < 3) {
            return "Ad en az 3 karakter olmalı";
          } else {
            return null;
          }
        },
        onSaved: (value) {},
      ),
    );
  }

  Stack buildProfilePhoto(BuildContext context) {
    return Stack(
      children: [
        Container(
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
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(myUser.imageUrl),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return const EditPhoto();
                },
              );
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: Colors.blueAccent,
                ),
                color: Colors.blueAccent,
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container getTextField(
      String labelText, //,
      bool isPasswordTextField,
      String name) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
          obscureText: isPasswordTextField,
          //  controller: controller,
          initialValue: name,
          decoration: InputDecoration(
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
          onChanged: (value) {
            _setNewValue(value, labelText);
            _validateEmail(value);
          },
          onSaved: (value) {},
          validator: (value) {
            _getInitialValue(labelText, value!);
            return null;
          }),
    );
  }

  _getInitialValue(String text, String value) {
    if (text == "Ad") {
      if (value.length < 6) {
        return "İsim en az 6 karakter olmalı";
      } else {
        return null;
      }
    }
    if (text == "Email") {
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      if (value.isEmpty || !regex.hasMatch(value)) {
        return 'Lütfen geçerli email giriniz.';
      } else {
        return null;
      }
    }
    if (text == "Şifre") {
      if (value.length < 6) {
        return "Şifre en az 6 karakter olmalı";
      } else {
        return null;
      }
    } else {
      return 0;
    }
  }

  _validateEmail(value) {
    EmailValidator.validate(value);
  }

  void _setNewValue(String value, String id) {
    if (id == "Ad") {
      name = value;
    }
    if (id == "Email") {
      email = value;
    }
    if (id == "Şifre") {
      password = value;
    }
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

  _setInfo(String value, String label) async {
    if (label == "Ad") {
      name = value;
    }
    if (label == "Şehir") {
      city = value;
    }
    if (label == "İlçe") {
      town == value;
    }
  }
}
