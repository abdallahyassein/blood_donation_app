import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:spotway_app/helper/AdminHelper.dart';
import 'package:spotway_app/pages/admin/client_page.dart';
import 'package:spotway_app/provider/UserProvider.dart';
import 'package:spotway_app/widgets/loading_progress.dart';

class SearchPage extends StatefulWidget {
  final String searchData;

  SearchPage(this.searchData);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchData = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var token = Provider.of<UserProvider>(context).getToken();
    var users = AdminHelper.getUsers(widget.searchData, token);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/blood_back.jpg"),
                fit: BoxFit.cover),
          ),
          child: FutureBuilder(
            future: users,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                //print(snapshot.data);
                return LoadingProgress();
              } else if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.hasData) {
                return Card(
                  color: Color.fromRGBO(56, 56, 56, 0.9),
                  child: Center(
                    child: Text("there are no client with this data"),
                  ),
                );
              } else if (snapshot.data.length == 0) {
                return Card(
                  color: Color.fromRGBO(56, 56, 56, 0.9),
                  child: Center(
                    child: Text(
                      "there are no clients with this data",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else {
                // print(snapshot.data);
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      var allusers = snapshot.data;
                      print(snapshot.data);
                      return Container(
                        padding: EdgeInsets.all(5),
                        height: 100,
                        child: Card(
                          color: Color.fromRGBO(56, 56, 56, 0.96),
                          child: InkWell(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      allusers[i].name,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  allusers[i].email,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  allusers[i].phoneNumber.toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  (MaterialPageRoute(
                                      builder: (context) => ClientPage(
                                          allusers[i].phoneNumber))));
                            },
                          ),
                        ),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
