import 'package:flutter/material.dart';

class CtmTextField extends StatefulWidget {
  const CtmTextField({
    super.key,
    required this.text, required this.mycontroller,
  });
  final String text;
  final TextEditingController mycontroller;
  @override
  State<CtmTextField> createState() => _CtmTextFieldState();
}

class _CtmTextFieldState extends State<CtmTextField> {
  @override
  Widget build(BuildContext context) {
    String thetext = widget.text;
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: TextFormField(

          controller: widget.mycontroller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(05),
            labelText: thetext,
            fillColor: const Color(0xff21725E),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff21725E), width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff21725E), width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ));
  }
}
