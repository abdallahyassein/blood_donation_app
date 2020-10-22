import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotway_app/model/User.dart';

String url = 'http://127.0.0.1:8000/api/';

class UserProvider extends ChangeNotifier {
  User _user;
  var _token;

  User getUserInf() {
    return _user;
  }

  getToken() {
    return _token;
  }

  setUserInf(User user) {
    _user = user;
    print(_user.email);
    notifyListeners();
  }

  setToken(token) {
    _token = token;
    notifyListeners();
  }

  Future<dynamic> login(String email, String password) async {
    var body = {'email': email, 'password': password};

    var result2 = {"type": "client", "result": false};
    Dio dio = new Dio();
    await dio
        .post(
      url + "login",
      data: body,
    )
        .then((response) {
      if (response.statusCode == 200) {
        print(response.data["success"]["token"]);

        setToken(response.data["success"]["token"]);
        User user = User.fromMap(response.data["user"]);
        setUserInf(user);

        result2 = {"type": user.type, "result": true};
      }
    }).catchError((error) => print(error));

    return result2;
  }

  Future register(String name, String bloodType, int phoneNumber, String email,
      String password, String confirmPassword) async {
    bool result = false;

    var body = {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'blood_type': bloodType,
      'password': password,
      'c_password': confirmPassword
    };

    Dio dio = new Dio();
    await dio
        .post(
      url + "register",
      data: body,
    )
        .then((response) {
      print(response.data["success"]["token"]);
      setToken(response.data["success"]["token"]);
      // setUserInf(User.fromMap(response.data["success"]["user"]));
      result = true;
    }).catchError((error) => print(error));

    return result;
  }
}
