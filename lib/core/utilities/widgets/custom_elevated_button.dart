import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final TextStyle? textStyle;

  const CustomElevatedButton({super.key, required this.onPressed, required this.text, this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,
      style: textStyle ?? TextStyle( color: Colors.white, fontSize: 16.sp)),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
