import 'package:flutter/material.dart';
import 'package:hiveapp/presentation/viewmodels/user_viewmodel.dart';
import 'package:hiveapp/presentation/widgets/custom_add_dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive tutorial"),
        centerTitle: true,
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Container(
                color: Colors.blue,
                child: ListTile(
                  title: Text(
                    "User Name and Age",
                    style: TextStyle(color: Colors.yellow),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomAddDialog(),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.usersInfo.length,
                  itemBuilder: (context, index) {
                    final userInfo = viewModel.usersInfo[index];
                    return ListTile(
                      title: Text(userInfo.userName),
                      subtitle: Text(userInfo.age.toString()),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
