import 'package:flutter/material.dart';
import 'package:flutter_learn/learn/state/model/userinfo.dart';

class UserInfoProvider extends ChangeNotifier {
  UserInfo _userInfo;

  UserInfoProvider(this._userInfo);

  UserInfo get userInfo => _userInfo;

  set userInfo(UserInfo value) {
    _userInfo = value;
    notifyListeners();
  }
}
