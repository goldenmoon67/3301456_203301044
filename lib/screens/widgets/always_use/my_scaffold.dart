import 'package:flutter/material.dart';

class MyScaffoldWithAppbar extends StatelessWidget {
  late Widget mybody;
  late String appTitle;
   MyScaffoldWithAppbar({required this.mybody,required this.appTitle,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(appTitle,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: mybody,
    );
  }
}
