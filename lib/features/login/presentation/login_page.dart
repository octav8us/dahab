import 'package:dahab/core/utilities/widgets/custom_elevated_button.dart';
import 'package:dahab/features/login/domain/user_provider.dart';
import 'package:dahab/features/login/presentation/widgets/form_field_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تسجيل الدخول'),
        ),
        body: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FormFieldImpl(
                  hintText: 'اسم المستخدم',
                ),
                SizedBox(height: 16.h),
                const FormFieldImpl(
                  hintText: 'كلمة السر',
                  isObsecure: true,
                ),
                SizedBox(height: 16.h),
                CustomElevatedButton(
                  onPressed: () {
                    Provider.of<UserProvider>(context, listen: false)
                        .logIn("username", "password");
                  },
                  text: 'تسجيل الدخول',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
