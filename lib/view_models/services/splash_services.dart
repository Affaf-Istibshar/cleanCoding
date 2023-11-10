//
//
// import 'dart:async';
//
// import 'package:get/get.dart';
// import 'package:mvvm/resources/routes/routes_name.dart';
// import 'package:mvvm/view_models/controllers/userPrefrences/user_prefrences_vm.dart';
//
// class SplashServices {
//   UserPreferences userPreferences = UserPreferences();
//   void isUserLogin(){
//
//  userPreferences.getUser().then((value) {
//    print(value.token);
//    if(value.token!.isEmpty || value.token.toString() == 'null'){
//      Timer(const  Duration(seconds: 3),
//              () =>
//              Get.toNamed(RoutesName.loginView)
//      );
//    }else{
//      Timer(const  Duration(seconds: 3),
//              () =>
//              Get.toNamed(RoutesName.homeView)
//      );
//    }
//  });
//
//   }
// }


import 'dart:async';

import 'package:get/get.dart';
import 'package:mvvm/resources/routes/routes_name.dart';
import 'package:mvvm/view_models/controllers/userPrefrences/user_prefrences_vm.dart';

class SplashServices {

  UserPreferences userPreference = UserPreferences();

  void isLogin(){


    userPreference.getUser().then((value){

      print(value.token);
      print(value.isLogin);

      if(value.isLogin == false || value.isLogin.toString() == 'null'){
        Timer(const Duration(seconds: 3) ,
                () => Get.toNamed(RoutesName.loginView) );
      }else {
        Timer(const Duration(seconds: 3) ,
                () => Get.toNamed(RoutesName.homeView) );
      }
    });


  }
}