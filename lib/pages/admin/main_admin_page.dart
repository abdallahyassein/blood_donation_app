import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotway_app/pages/admin/search_page.dart';
import 'package:spotway_app/pages/admin/statistics_page.dart';

class MainAdminPage extends StatefulWidget {
  @override
  _MainAdminPageState createState() => _MainAdminPageState();
}

class _MainAdminPageState extends State<MainAdminPage> {
  TextEditingController searchData = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/blood_back.jpg"),
                  fit: BoxFit.cover),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      color: Color.fromRGBO(56, 56, 56, 0.8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Search Clients",
                              style: GoogleFonts.abel(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      color: Color.fromRGBO(56, 56, 56, 0.95),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextFormField(
                                  controller: searchData,
                                  style: TextStyle(color: Colors.white),
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                  decoration: InputDecoration(
                                      hintText: "Search Clients",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'please user name,phone number or email here';
                                    }
                                    return null;
                                  }),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue[300]),
                                child: Center(
                                  child: Text(
                                    "Search",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (searchData.text.isNotEmpty) {
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) =>
                                              SearchPage(searchData.text))));
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green[300]),
                                child: Center(
                                  child: Text(
                                    "Statistics",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                        builder: (context) =>
                                            StatisticsPage())));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
