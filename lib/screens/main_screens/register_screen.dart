import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/firebase_services/firestore_user_service.dart';
import 'package:halisaha_app/model/city.dart';
import 'package:halisaha_app/screens/helper_secreens/widgets/always_use/my_scaffold.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final snackbarMessage = SnackBar(
    content: const Text('Kayıt Başarılı!'),
    backgroundColor: Colors.green.shade400,
  );
  final _keyReg = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _townController;
  late TextEditingController _cityController;

  late String? name, email, password;
  late Future<List<City>> cityList;
  late String dropdownValue = "Zonguldak";

  @override
  void initState() {
    super.initState();
    cityList = _getCityList();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _cityController = TextEditingController();
    _townController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _townController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWithAppbar(
      appTitle: "Kayıt Ol",
      mybody: Container(
        padding: const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _keyReg,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                getTextfield(
                  "Ad",
                  "Adınızı giriniz",
                  false, //character visibilitty
                  _nameController,
                  TextInputType.text,
                ),
                getEmailTextField(),
                getPasswordTextfield(),
                getCityButton(context),
                /* getTextfield(
                  "Şehir",
                  "Bulunduğunuz Şehir",
                  false, //character visibilitty
                  _cityController,
                  TextInputType.text,
                ),
                */
                getTextfield(
                  "İlçe",
                  "Bulunduğunuz İlçe",
                  false, //character visibilitty
                  _townController,
                  TextInputType.text,
                ),
                buildButtons()
              ],
            ),
          ),
        ),
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
      String labeltext,
      String placeholder,
      bool isPasswordTextField,
      TextEditingController controller,
      TextInputType? keyboardType) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: isPasswordTextField,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          labelText: labeltext,
          hintText: placeholder,
        ),
        onChanged: (
          value,
        ) {
          _setInfo(value, labeltext);
        },
        validator: (value) {
          if (labeltext == "Ad" && value!.length < 3) {
            return "Ad en az 3 karakter olmalı";
          } else {
            return null;
          }
        },
        onSaved: (value) {},
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
              CrudServices.addNewUser(
                  name: name!,
                  email: email!,
                  password: password!,
                  city: "Zonguldak",
                  town: "Ereğli");
              CrudServices.plusPlusUsers();
              ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
              Navigator.pop(context);
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
  }

  Future<List<City>> _getCityList() async {
    try {
      var response =
          await Dio().get('http://api-sehir.herokuapp.com/api/cities/');
      List<City> _cityList = [];
      if (response.statusCode == 200) {
        _cityList =
            (response.data as List).map((e) => City.fromMap(e)).toList();
      } else {
        _cityList = [
          City(date: " 10", cityInfo: CityInfo(plaka: 1, city: "city"))
        ];
      }
      return _cityList;
    } on DioError {
      return [City(date: " 10", cityInfo: CityInfo(plaka: 1, city: "city"))];
    }
  }

  getCityButton(BuildContext context) {
    return FutureBuilder(
        future: cityList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<City> cities = snapshot.data as List<City>;
            List<String> citInfo = [];
            for (int i = 0; i < cities.length; i++) {
              citInfo.add((cities[i].cityInfo.city.toString()));
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  // elevation: 16,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  alignment: Alignment.center,
                  underline: const SizedBox(),
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: citInfo.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(child: Text(value)),
                    );
                  }).toList(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
