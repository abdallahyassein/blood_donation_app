import 'package:dio/dio.dart';
import 'package:spotway_app/model/Statistics.dart';
import 'package:spotway_app/model/User.dart';

String url = 'http://127.0.0.1:8000/api/';

class AdminHelper {
  static Future<User> profile(phoneNumber, token) async {
    var data;
    User user;
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Content-Type"] = 'application/json';
    dio.options.headers["Accept"] = 'application/json';
    await dio
        .get(
      url + "profile?phoneNumber=$phoneNumber",
    )
        .then((response) {
      data = response.data['user'];

      user = User.fromMap(data);

      print(user.name);
    }).catchError((error) => print(error));

    //posts.shuffle();
    return user;
  }

  static Future<List<User>> getUsers(searchData, token) async {
    var data;
    List<User> users = [];
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Content-Type"] = 'application/json';
    dio.options.headers["Accept"] = 'application/json';
    await dio
        .get(
      url + "livesearch?data=$searchData",
    )
        .then((response) {
      if (response.data["users"] == null ||
          response.data["users"].length == 0) {
        print("There are no Friend Requests right now");
      } else {
        data = response.data["users"]["data"];
        int dataLength = data.length;
        // print(dataLength);

        for (int i = 0; i < dataLength; i++) {
          //print(data["post"]["comments"]);
          User user = User.fromMap(data[i]);

          users.add(user);

          // print(user.name);
        }
      }
    }).catchError((error) => print(error));

    return users;
  }

  static Future<Statistics> getStatistics(token) async {
    var data;
    Statistics statistics;
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Content-Type"] = 'application/json';
    dio.options.headers["Accept"] = 'application/json';
    await dio
        .get(
      url + "statistics",
    )
        .then((response) {
      if (response.data == null || response.data.length == 0) {
        print("There are no data right now");
      } else {
        data = response.data;

        statistics = Statistics.fromMap(data);
      }
    }).catchError((error) => print(error));

    return statistics;
  }

  static Future addBloodPoints(int points, int phoneNumber, token) async {
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    var body = {"points": points, "phoneNumber": phoneNumber};
    await dio
        .post(
          url + "editbloodpoints",
          data: body,
        )
        .then((response) => print(response.data["success"]))
        .catchError((error) => print(error));
  }
}
