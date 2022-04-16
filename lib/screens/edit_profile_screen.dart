
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/hive_service.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:halisaha_app/screens/widgets/always_use/my_scaffold.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final snackbarMessage = SnackBar(
    content: const Text('Başarı ile düzenlendi!'),
    backgroundColor: Colors.green.shade400,
  );
  UserInfo userInfo=HiveService.getData()[HiveService.userIndex];
  String name="",email="",password="";
  bool showPassword = false;
  /*
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
  late TextEditingController _cityController;
  late TextEditingController _townController;
  late TextEditingController _neighborhoodController;
  late TextEditingController _nameController;

   */

  @override
  void initState() {
    super.initState();
    /*
    _passwordController = TextEditingController();
    _cityController = TextEditingController();
    _townController = TextEditingController();
    _neighborhoodController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _nameController = TextEditingController();

     */
  }

  @override
  void dispose() {
    /*
    _cityController.dispose();
    _townController.dispose();
    _neighborhoodController.dispose();
    _phoneNumberController.dispose();
    _nameController.dispose();

     */
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
                false,
                //_nameController,
                userInfo.name
              ),
              getTextfield(
                "Email",

                false,
                //_phoneNumberController,
                  userInfo.email
              ),
              getTextfield(
                "Şifre",
                true,
                //_passwordController,
                  userInfo.password
              ),
              getTextfield(
                "Şehir",

                false,
                //_cityController,
                ""
              ),
              getTextfield(
                "İlçe",

                false,
               // _townController,
                ""
              ),
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
            onPressed: () {},
            child: const Text('İPTAL',
                style: TextStyle(
                    fontSize: 14, letterSpacing: 2.2, color: Colors.black)),
          ),
          ElevatedButton(
            onPressed: () {
             String newName="",newPassword="",newEmail="";
              if(name!="") {
               newName= name;
              }else{
                newName=HiveService.getData()[HiveService.userIndex].name.toString();
              }
              if(email!=""){
                newEmail=email;
              }else{
                newEmail=HiveService.getData()[HiveService.userIndex].email.toString();
              }
              if(password!=""){
                newPassword=password;
              }else{
                newPassword=HiveService.getData()[HiveService.userIndex].password.toString();
              }
              HiveService.updateData(newName,newEmail, newPassword);
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
            image: const DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage("assets/images/mrc.jpg"),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
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
      ],
    );
  }

  Container getTextfield(String labeltext, //String placeholder,
      bool isPasswordTextField,/* TextEditingController controller*/String nameas) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: isPasswordTextField,
      //  controller: controller,
        initialValue: nameas,
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          border: const OutlineInputBorder(),
          labelText: labeltext,
        ),
        onChanged:(value) {
          _setNewValue(value,labeltext);
          _validateEmail(value);
        },
        onSaved: (value) {
        },
        validator:(value){
          _getInitialValue(labeltext,value!);
        },

      ),
    );
  }

   _getInitialValue(String text,String value) {
    if(text=="Ad"){

        if (value.length < 6) {
          return "İsim en az 6 karakter olmalı";
        } else {
          return null;
        }

    }if(text=="Email"){
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

    }if(text=="Şifre"){

        if (value.length < 6) {
          return "Şifre en az 6 karakter olmalı";
        } else {
          return null;
        }

    } else{
      return 0;

    }
  }

  _validateEmail(value) {
    EmailValidator.validate(value);
  }

  void _setNewValue(String value,String id) {

    if(id=="Ad"){

      name=value;

    }if(id=="Email"){
      email=value;

    }if(id=="Şifre"){

    password=value;

    }
  }

}
