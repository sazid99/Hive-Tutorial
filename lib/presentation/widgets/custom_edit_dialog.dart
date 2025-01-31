import 'package:flutter/material.dart';
import 'package:hiveapp/data/models/user_model.dart';
import 'package:hiveapp/presentation/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomEditDialog extends StatelessWidget {
  final int index;
  const CustomEditDialog({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController userAgeController = TextEditingController();
    return SingleChildScrollView(
      child: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          return AlertDialog(
            title: Text("Edit User Info"),
            content: SizedBox(
              height: 140,
              child: Column(
                spacing: 10,
                children: [
                  TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: userAgeController,
                    decoration: InputDecoration(
                      labelText: "User Age",
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
                  final updatedUserInfo = UserModel(
                      userName: userNameController.text,
                      age: int.tryParse(userAgeController.text) ?? 0);
                  viewModel.updateUserInfo(index, updatedUserInfo);
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      ),
    );
  }
}
