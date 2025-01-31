import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveapp/data/models/user_model.dart';

class UserViewModel with ChangeNotifier {
  late final Box<UserModel> _userViewModel = Hive.box<UserModel>('userModel');

  List<UserModel> get usersInfo => _userViewModel.values.toList();

  void addUserInfo(UserModel addInfo) {
    _userViewModel.add(addInfo);
    notifyListeners();
  }

  void deleteInfo(int index) {
    _userViewModel.deleteAt(index);
    notifyListeners();
  }

  void updateUserInfo(int index, UserModel updateInfo) {
    _userViewModel.put(_userViewModel.keyAt(index), updateInfo);
    notifyListeners();
  }
}
