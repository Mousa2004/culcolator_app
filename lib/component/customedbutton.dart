import 'package:flutter/material.dart';

class Customedbutton extends StatelessWidget {
  String name;
  Color? background;
  Color? textcolor;
  int flex;
  void Function(String) onPressed;
  Customedbutton({
    super.key,
    required this.name,
    required this.onPressed,
    this.background,
    this.textcolor,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(16),
          color: background,
        ),

        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 15),

          onPressed: () {
            onPressed(name);
          },
          child: Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}
