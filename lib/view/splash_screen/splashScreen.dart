import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/view_models/services/splash_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // splashScreen.isUserLogin();
    splashScreen.isLogin();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        // title: const Text(
        //   'GetX MVVM Practice',
        // ),
        title: Text('About'.tr),
      ),
      body: Center(
        child: Text('welcome_back'.tr),
      )

      // Column(
      //   children: [
      //     SizedBox(height: 20,),
      //     RoundButton(onPress: (){
      //     },
      //     title: 'Login',width: double.infinity, loading: true,),
      //     SizedBox(height: 30,),
      //     RoundButton(onPress: (){
      //
      //     },
      //     title: 'Sign up',),
      //   ],
      // )
      //InternetExceptionWidget(),
      // body: Image(
      //   image: AssetImage(ImageAssets.splashScreen),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     // Utils.toastMessage('Good to see you');
      //     Utils.toastMessageCenter('Affaf Istibshar Azhar');
      //     },
      // ),
    );
  }
}
