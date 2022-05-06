import 'package:flutter/material.dart';
import 'package:halisaha_app/constants/login_constants.dart';
import 'package:halisaha_app/screens/register_screen.dart';

class SignButton extends StatelessWidget {
  const SignButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Hesabınız Yok Mu?'),
        const SizedBox(
          width: 20,
        ),
        TextButton(
            child: const Text(
              'Hesap Oluştur',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/HomeScreen');
            })
      ],
    );
  }
}
