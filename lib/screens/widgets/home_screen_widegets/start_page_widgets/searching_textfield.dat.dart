import 'package:flutter/material.dart';

class SearchLocationTextField extends StatelessWidget {
  const SearchLocationTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Bulunduz Yer",
        fillColor: Colors.grey.shade200,
        iconColor: Colors.blueAccent,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
