import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spotway_app/pages/client/blood_points.dart';
import 'package:spotway_app/provider/UserProvider.dart';

class MainClientPage extends StatefulWidget {
  @override
  _MainClientPageState createState() => _MainClientPageState();
}

class _MainClientPageState extends State<MainClientPage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).getUserInf();
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
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Card(
                        color: Color.fromRGBO(56, 56, 56, 0.9),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Hi , ${user.name}",
                                  style: GoogleFonts.abel(
                                      textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      color: Color.fromRGBO(56, 56, 56, 0.9),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Center(
                                child: Image.asset(
                                    "assets/images/blood_icon.jpg",
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Check your blood points",
                              style: GoogleFonts.abel(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              )),
                            ),
                            SizedBox(
                              height: 10,
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
                                    "Blood Points",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BloodPointsPage()));
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
