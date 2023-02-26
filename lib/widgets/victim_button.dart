import 'package:flutter/material.dart';

class VictimButton extends StatelessWidget {
  final bool iAmSafe;
  final VoidCallback onPressed;
  final double? height;
  final Color? backgroundColor;
  const VictimButton(
      {Key? key,
      this.iAmSafe = false,
      required this.onPressed,
      this.height = 80,
      this.backgroundColor = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height!),
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      child: Text(
        iAmSafe ? "Güvendeyim" : "Afetzedeyim",
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
    );
  }
}
