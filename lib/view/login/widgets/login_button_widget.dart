import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../resources/components/roundButton.dart';
import '../../../view_models/controllers/login/login_view_model.dart';
class LoginButtonWidget extends StatelessWidget {
  final formKey;
  LoginButtonWidget({super.key, required this.formKey});
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        width: 200,
        title: 'login'.tr,
        loading: loginVM.loading.value,
        onPress: () {
          if(formKey.currentState!.validate()){
            loginVM.loginApi();
          }
        },
      );
    });
  }
}
