import 'package:flutter/material.dart';
class RegistrationButton extends StatelessWidget {
  final String text ;
  const RegistrationButton(this.text);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      minWidth: 220,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: const Color(0xffC89FEB),
      child: Text(text,
          style: const TextStyle(fontSize: 25, color: Colors.white)),
    );
  }
}
