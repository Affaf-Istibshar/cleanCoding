// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:mvvm/models/login_models/user_model.dart';
//
// class UserPreferences {
//   //MODEL TO stored in Shared preferences through model
//
//   Future<bool> saveUser(UserModel responseModel) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('token', responseModel.token.toString());
//     return true;
//   }
//
//   Future<UserModel> getUser() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     String? token = sp.getString('token');
//     return UserModel(
//       token: token,
//     );
//   }
//
//   Future<bool> removeUser() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.clear();
//     return true;
//   }
// }


import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/login_models/user_model.dart';

class UserPreferences {

  Future<bool> saveUser(UserModel responseModel)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    sp.setBool('isLogin', responseModel.isLogin!);

    return true ;
  }

  Future<UserModel> getUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');

    return UserModel(
        token: token ,
        isLogin: isLogin
    ) ;
  }

  Future<bool> removeUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true ;
  }
}