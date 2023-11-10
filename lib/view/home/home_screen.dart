import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/resources/components/generalException.dart';
import 'package:mvvm/resources/components/internet_exception_widget.dart';
import 'package:mvvm/resources/routes/routes_name.dart';
import 'package:mvvm/view/home/widgets/userlist_widget.dart';
import 'package:mvvm/view_models/controllers/homeVM/home_view_model.dart';
import 'package:mvvm/view_models/controllers/userPrefrences/user_prefrences_vm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeViewModel = Get.put(HomeViewModel());

  UserPreferences userPreferences = UserPreferences();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home Screen'),
          actions: [
            IconButton(
              onPressed: () {
                userPreferences.removeUser().then((value) {
                  Get.toNamed(RoutesName.loginView);
                });
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Obx(() {
          switch (homeViewModel.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.ERROR:
              if (homeViewModel.rxRequestStatus.value == 'No internet') {
                return InterNetExceptionWidget(onPress: () {});
              } else {
                // return Text(homeViewModel.error.toString());
                return GeneralExceptionWidget(onPress: (){
                  homeViewModel.refreshApi();
                });
              }
            case Status.COMPLETED:
              return
                UserListWidget();
          }
        }));
  }
}
