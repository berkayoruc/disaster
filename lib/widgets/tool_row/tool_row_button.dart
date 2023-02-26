import 'package:flutter/material.dart';

class ToolRowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color? color;
  final Color? textColor;
  final double? size;
  const ToolRowButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon,
      this.color = Colors.purple,
      this.size = 140,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: textColor,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
