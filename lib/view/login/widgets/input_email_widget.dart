import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../utills/utils.dart';
import '../../../view_models/controllers/login/login_view_model.dart';
class InputEmailWidget extends StatelessWidget {
   InputEmailWidget({super.key});
   final loginVM = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value){
        if(value!.isEmpty) {
          Utils.snackBar('Email', 'enter_email'.tr);
        }
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
        hintText: 'email_hint'.tr,
        border:  const OutlineInputBorder(),
      ),
    );
  }
}
