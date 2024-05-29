import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_model.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('https://6655d3c83c1d3b60293b410b.mockapi.io/data'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        var userList = jsonResponse.map((data) => User.fromJson(data)).toList();
        users.assignAll(userList);
      }
    } finally {
      isLoading(false);
    }
  }
}
