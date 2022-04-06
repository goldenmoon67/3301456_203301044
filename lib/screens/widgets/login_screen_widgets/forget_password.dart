import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //forgot password screen
      },
      child: const Text(
        'Şiremi Unuttum',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
