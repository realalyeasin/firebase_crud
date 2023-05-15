import 'package:flutter/material.dart';

class CtmButton extends StatelessWidget {
  const CtmButton({super.key, required this.btntext, required this.onPress});
  final String btntext;
  final GestureTapCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff21725E),
          side: const BorderSide(
            width: 5.0,
            color: Color(0xff21725E),
          )),
      child: SizedBox(
        height: 40,
        width: 500,
        child: Center(child: Text(btntext.toUpperCase())),
      ),
    );
  }
}
