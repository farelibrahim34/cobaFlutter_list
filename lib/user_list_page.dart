import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class UserListPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pengguna'),
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(userController.users[index].avatar),
                ),
                title: Text(userController.users[index].name),
                subtitle: Text('ID: ${userController.users[index].id}\nCreated at: ${userController.users[index].createdAt}'),
              );
            },
          );
        }
      }),
    );
  }
}
