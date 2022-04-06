import 'package:flutter/material.dart';

class IsReplaceableCheckBox extends StatefulWidget {
  const IsReplaceableCheckBox({Key? key}) : super(key: key);

  @override
  State<IsReplaceableCheckBox> createState() => _IsReplaceableCheckBoxState();
}

class _IsReplaceableCheckBoxState extends State<IsReplaceableCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        checkColor: Colors.white,
        fillColor:
            MaterialStateProperty.resolveWith((states) => Colors.blueAccent),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        });
  }
}
