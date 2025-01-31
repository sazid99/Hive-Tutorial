import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final int age;

  UserModel({
    required this.userName,
    required this.age,
  });
}
