import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spotway_app/helper/AdminHelper.dart';
import 'package:spotway_app/provider/UserProvider.dart';
import 'package:spotway_app/widgets/card_statistics.dart';
import 'package:spotway_app/widgets/loading_progress.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  TextEditingController marketPoints = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var token = Provider.of<UserProvider>(context).getToken();
    var statistics = AdminHelper.getStatistics(token);

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
            future: statistics,
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
              } else {
                var statisticsData = snapshot.data;
                return ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                                          "Statistics",
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
                            CardStatistics(
                              "A+",
                              statisticsData.sumAPositive,
                            ),
                            CardStatistics(
                              "A-",
                              statisticsData.sumANegative,
                            ),
                            CardStatistics(
                              "B+",
                              statisticsData.sumBPositive,
                            ),
                            CardStatistics(
                              "B-",
                              statisticsData.sumBNegative,
                            ),
                            CardStatistics(
                              "O+",
                              statisticsData.sumOPositive,
                            ),
                            CardStatistics(
                              "O-",
                              statisticsData.sumONegative,
                            ),
                            CardStatistics(
                              "AB+",
                              statisticsData.sumABPositive,
                            ),
                            CardStatistics(
                              "AB-",
                              statisticsData.sumABNegative,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
