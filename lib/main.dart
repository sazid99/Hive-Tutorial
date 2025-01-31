import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hiveapp/data/models/user_model.dart';
import 'package:hiveapp/presentation/viewmodels/user_viewmodel.dart';
import 'package:hiveapp/presentation/views/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('userModel');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
