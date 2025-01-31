import 'package:flutter/material.dart';
import 'package:hiveapp/data/models/user_model.dart';
import 'package:hiveapp/presentation/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomAddDialog extends StatelessWidget {
  const CustomAddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController userAgeController = TextEditingController();
    return SingleChildScrollView(
      child: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          return AlertDialog(
            title: Text("Add User Info"),
            content: SizedBox(
              height: 140,
              child: Column(
                spacing: 10,
                children: [
                  TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: userAgeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  final newUserInfo = UserModel(
                      userName: userNameController.text,
                      age: int.tryParse(userAgeController.text) ?? 0);
                  viewModel.addUserInfo(newUserInfo);
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          );
        },
      ),
    );
  }
}
