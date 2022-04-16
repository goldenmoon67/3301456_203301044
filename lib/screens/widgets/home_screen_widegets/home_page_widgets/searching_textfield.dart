import 'package:flutter/material.dart';

class SearchingTextFieldForHomePage extends StatelessWidget {
  const SearchingTextFieldForHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        decoration:const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          prefixStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          hintText: "Takım, Futbolcu, Halısaha arayabilirsiniz.",
          hintStyle: TextStyle(color: Colors.white),
          suffixStyle: TextStyle(color:Colors.white),
          fillColor: Colors.white,
          iconColor: Colors.white,
          hoverColor: Colors.white,
          labelStyle:  TextStyle(fontWeight: FontWeight.bold),
          border:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      ),
    );
  }
}
