import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardStatistics extends StatelessWidget {
  final String type;
  final int typeAmount;

  CardStatistics(this.type, this.typeAmount);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Card(
          color: Color.fromRGBO(56, 56, 56, 0.95),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  type,
                  style: GoogleFonts.abel(
                      textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: CircularPercentIndicator(
                      radius: 130.0,
                      animation: true,
                      animationDuration: 2000,
                      lineWidth: 7.0,
                      percent: typeAmount >= 1000 ? 1 : ((typeAmount) / 1000),
                      center: new Text(
                        typeAmount >= 1000
                            ? "100%"
                            : (((typeAmount) / 1000) * 100).toStringAsFixed(1) +
                                "%",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      progressColor: Color.fromRGBO(204, 62, 50, 1)),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
