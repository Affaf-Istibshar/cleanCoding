
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/view/login/widgets/input_email_widget.dart';
import 'package:mvvm/view/login/widgets/input_password_widget.dart';
import 'package:mvvm/view/login/widgets/login_button_widget.dart';

import '../../view_models/controllers/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
 final loginVM = Get.put(LoginViewModel());
 final _formKey = GlobalKey<FormState>();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('login'.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
              children: [
               InputEmailWidget(),
                SizedBox(height: 20,),
                InputPasswordWidget(),
              ],
            )),
              const SizedBox(
                height: 30,
              ),
              LoginButtonWidget(formKey: _formKey),
            ],
          ),
        ));
  }
}
