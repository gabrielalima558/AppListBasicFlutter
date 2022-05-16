import 'package:flutter/material.dart';

class GabrielaCard extends StatelessWidget {
  final String? leftText;
  final String rightText;

  GabrielaCard({required this.leftText, this.rightText = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.pink, width: 2)),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [Text(leftText!), const Spacer(), Text(rightText)],
      ),
    );
  }
}
