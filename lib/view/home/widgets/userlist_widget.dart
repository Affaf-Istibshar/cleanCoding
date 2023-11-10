import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controllers/homeVM/home_view_model.dart';
class UserListWidget extends StatelessWidget {
   UserListWidget({super.key});

  @override
  final homeViewModel = Get.put(HomeViewModel());

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: homeViewModel.userList.value.data!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(homeViewModel
                    .userList.value.data![index].avatar
                    .toString()),
              ),
              title: Text(homeViewModel
                  .userList.value.data![index].firstName
                  .toString()),
              subtitle: Text(homeViewModel
                  .userList.value.data![index].email
                  .toString()),
            ),
          );
        });
  }
}
