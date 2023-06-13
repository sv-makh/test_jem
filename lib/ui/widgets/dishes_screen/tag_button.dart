import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_jem/bloc/dishes_bloc/dishes_bloc.dart';

//кнопка с тегом
class TagButton extends StatelessWidget {
  final String text;
  final String activeTag;

  const TagButton({super.key, required this.text, required this.activeTag});

  @override
  Widget build(BuildContext context) {
    //флаг активации тега кнопки
    bool isButtonActivated = false;
    if (text == activeTag) {
      isButtonActivated = true;
    }

    return TextButton(
      onPressed: () {
        BlocProvider.of<DishesBloc>(context).add(DishesTagTapped(text));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(isButtonActivated
            ? const Color(0xff3364E0)
            : const Color(0xffF8F7F5)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: SizedBox(
        height: 35,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16,
                color: isButtonActivated ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
