import 'package:flutter/material.dart';

class InfoDisplayWidget extends StatelessWidget {
  final String title;
  final String data;
  const InfoDisplayWidget({required this.title, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        SizedBox(width: 5),
        Text(data, style: TextStyle(fontSize: 18, color: Colors.indigo))
      ],
    );
  }
}
