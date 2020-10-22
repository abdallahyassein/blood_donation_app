import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:spotway_app/provider/UserProvider.dart';

class BloodPointsPage extends StatefulWidget {
  @override
  _BloodPointsPageState createState() => _BloodPointsPageState();
}

class _BloodPointsPageState extends State<BloodPointsPage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).getUserInf();
    return SafeArea(
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
                            "Check your Blood points",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            " Thanks a lot \n your donation will help a lot of people",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
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
                        children: <Widget>[
                          Container(
                            child: CircularPercentIndicator(
                                radius: 130.0,
                                animation: true,
                                animationDuration: 2000,
                                lineWidth: 7.0,
                                percent:
                                    user.amount >= 1 ? 1 : ((user.amount) / 10),
                                center: new Text(
                                  (((user.amount) / 10) * 100)
                                          .toStringAsFixed(1) +
                                      "%",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                progressColor: Color.fromRGBO(204, 62, 50, 1)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            user.bloodType,
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            user.amount >= 10
                                ? "Thanks a lot you have donated to the most allowed amount of blood"
                                : "${user.amount}/10",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(
                              color: user.amount == 5
                                  ? Colors.green[300]
                                  : Colors.white,
                              fontSize: 17,
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Blood Points",
                            style: GoogleFonts.abel(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
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
    );
  }
}
