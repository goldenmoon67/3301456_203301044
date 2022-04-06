import 'package:flutter/material.dart';
import 'package:halisaha_app/constants/login_constants.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 65),
      child: Text(
        LoginConstants.loginTitle,
        style: LoginConstants.loginTextStyle,
      ),
    );
  }
}
