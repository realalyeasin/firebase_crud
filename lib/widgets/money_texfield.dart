import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoneyTextField extends StatelessWidget {
  const MoneyTextField({super.key, required this.text, required this.montantcontroller, required this.devisecontroller});
  final String text;
 final TextEditingController devisecontroller;
  final TextEditingController montantcontroller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
              controller: montantcontroller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(3),
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                labelText: text,
                fillColor: const Color(0xff21725E),
              )),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 120,
          child: TextFormField(
            controller: devisecontroller,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(12)
              ],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Devise",
                fillColor: Color(0xff21725E),
              )),
        ),
      ],
    );
  }
}
