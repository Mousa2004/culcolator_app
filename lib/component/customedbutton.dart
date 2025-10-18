import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          color: background ?? Color(0xFF303136),
        ),

        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 15.h),

          onPressed: () {
            onPressed(name);
          },
          child: Text(
            name,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: textcolor ?? Color(0xFF29A8FF),
            ),
          ),
        ),
      ),
    );
  }
}
