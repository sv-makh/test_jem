import 'package:flutter/material.dart';

//длинная синяя кнопка

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomTextButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all<Color>(Color(0xff3364E0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Color(0xff3364E0)),
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
