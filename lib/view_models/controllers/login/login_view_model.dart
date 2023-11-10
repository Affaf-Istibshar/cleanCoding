// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:mvvm/models/login_models/user_model.dart';
// import 'package:mvvm/repos/login_repository/login_repo.dart';
// import 'package:mvvm/resources/routes/routes_name.dart';
// import 'package:mvvm/utills/utils.dart';
// import 'package:mvvm/view_models/controllers/userPrefrences/user_prefrences_vm.dart';
//
// class LoginViewModel extends GetxController {
//   UserPreferences userPreferences = UserPreferences();
//   final _api = LoginRepository();
//   final emailController = TextEditingController().obs;
//   final passwordController = TextEditingController().obs;
//   RxBool loading = false.obs;
//   final emailFocusNode = FocusNode().obs;
//   final passwordFocusNode = FocusNode().obs;
//
//   void loginApi() {
//     loading.value = true;
//     Map data = {
//       'email': emailController.value.text,
//       'password': passwordController.value.text,
//     };
//     _api.loginApi(data).then((value) {
//       loading.value = false;
//       //data dynamic ha
//       if (value['error'] == 'user not found') {
//         Utils.snackBar('Login', value['error']);
//       } else {
//         userPreferences
//             .saveUser(UserModel.fromJson(value))
//             .then((value) {
//            Get.toNamed(RoutesName.homeView);
//         })
//             .onError((error, stackTrace) {
//
//         });
//         Utils.snackBar('Login', 'Login Success');
//       }
//     }).onError((error, stackTrace) {
//       // print(error.toString());
//       loading.value = false;
//       Utils.snackBar('Error', error.toString());
//     });
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm/view_models/controllers/userPrefrences/user_prefrences_vm.dart';

import '../../../models/login_models/user_model.dart';
import '../../../repos/login_repository/login_repo.dart';
import '../../../resources/routes/routes_name.dart';
import '../../../utills/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreferences userPreference = UserPreferences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;

      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);

        userPreference.saveUser(userModel).then((value) {
          // releasing resources because we are not going to use this
          Get.delete<LoginViewModel>();
          Get.toNamed(RoutesName.homeView)!.then((value) {});
          Utils.snackBar('Login', 'Login successfully');
        }).onError((error, stackTrace) {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
