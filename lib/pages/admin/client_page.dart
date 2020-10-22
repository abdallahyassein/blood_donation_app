import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:spotway_app/helper/AdminHelper.dart';
import 'package:spotway_app/provider/UserProvider.dart';
import 'package:spotway_app/widgets/loading_progress.dart';

class ClientPage extends StatefulWidget {
  final int phoneNumber;
  ClientPage(this.phoneNumber);
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  TextEditingController marketPoints = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var token = Provider.of<UserProvider>(context).getToken();
    var user = AdminHelper.profile(widget.phoneNumber, token);

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
            future: user,
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
                var userData = snapshot.data;
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
                                          "${userData.name} Details",
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
                            Container(
                              width: double.infinity,
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
                                              percent: userData.amount >= 10
                                                  ? 1
                                                  : ((userData.amount) / 10),
                                              center: new Text(
                                                userData.amount >= 10
                                                    ? "100%"
                                                    : (((userData.amount) /
                                                                    10) *
                                                                100)
                                                            .toStringAsFixed(
                                                                1) +
                                                        "%",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              progressColor: Color.fromRGBO(
                                                  204, 62, 50, 1)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey[200]))),
                                          child: TextField(
                                            controller: marketPoints,
                                            style:
                                                TextStyle(color: Colors.white),
                                            textInputAction:
                                                TextInputAction.next,
                                            onEditingComplete: () =>
                                                FocusScope.of(context)
                                                    .unfocus(),
                                            decoration: InputDecoration(
                                                hintText: "add blood points",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: InputBorder.none),
                                            inputFormatters: [
                                              WhitelistingTextInputFormatter
                                                  .digitsOnly
                                            ],
                                          ),
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
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 50,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 50),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.blue[300]),
                                            child: Center(
                                              child: Text(
                                                "Add Points",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            if (marketPoints.text.isNotEmpty) {
                                              setState(() {
                                                AdminHelper.addBloodPoints(
                                                    int.parse(
                                                        marketPoints.text),
                                                    userData.phoneNumber,
                                                    token);
                                                marketPoints.clear();
                                              });
                                            }
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
