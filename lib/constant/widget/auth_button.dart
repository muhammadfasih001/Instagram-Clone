import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color txtColor;
  final Color? brdColor;
  final double? brdwidth;
  final bool circularLoader;
  final Color? bgcolo;
  final VoidCallback? onTap;

  const AuthButton({
    Key? key,
    required this.bgcolo,
    required this.title,
    required this.onTap,
    this.circularLoader = false,
    required this.height,
    required this.width,
    this.brdColor,
    this.brdwidth,
    required this.txtColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: bgcolo,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: brdColor ?? Colors.transparent,
                width: brdwidth ?? 0.0,
                style: BorderStyle.solid)),
        child: Center(
          child: circularLoader
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: txtColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
