import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key, required this.title, required this.data});
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(child: Container()),
        Text(data)
      ],
    );
  }
}
