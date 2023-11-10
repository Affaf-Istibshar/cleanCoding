import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/resources/getx_localization/getx_localization.dart';
import 'package:mvvm/resources/routes/routes.dart';




void main() {
  runApp(const GetxMvvm());
}

class GetxMvvm extends StatelessWidget {
  const GetxMvvm({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale:  Locale('en' ,'US'),
      fallbackLocale: const Locale('en' ,'US'),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}

