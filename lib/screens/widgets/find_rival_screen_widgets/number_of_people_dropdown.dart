
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberOfPeopleDropdown extends StatefulWidget {
  const NumberOfPeopleDropdown({Key? key}) : super(key: key);

  @override
  State<NumberOfPeopleDropdown> createState() => _NumberOfPeopleDropdownState();
}

class _NumberOfPeopleDropdownState extends State<NumberOfPeopleDropdown> {
  late String  dropdownValue="7 vs 7";
  late List<String> howManyPeople=["7 vs 7","8 vs 8","9 vs 9","10 vs 10","11 vs 11"];

  @override
  Widget build(BuildContext context) {
    return  DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: howManyPeople
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
