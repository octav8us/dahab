import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFieldImpl extends StatelessWidget {
  final String hintText;
  final bool? isObsecure;
  const FormFieldImpl({required this.hintText, this.isObsecure, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: TextFormField(
        obscureText: isObsecure ?? false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).focusColor,
            ),
          ),
          fillColor: Color(0xFFffa500) ,
          hintText: hintText,
          labelText: 'Username',
        ),
      ),
    );
  }
}
