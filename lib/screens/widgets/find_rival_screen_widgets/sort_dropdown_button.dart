import 'package:flutter/material.dart';

class SortDropDownButton extends StatefulWidget {
  const SortDropDownButton({Key? key}) : super(key: key);

  @override
  State<SortDropDownButton> createState() => _SortDropDownButtonState();
}

class _SortDropDownButtonState extends State<SortDropDownButton> {
  String dropdownValue = 'En Yakındakiler';
  @override
  Widget build(BuildContext context) {
    return  DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['En Yakındakiler', 'En yakın zamandakiler', ]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
