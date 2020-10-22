import 'dart:convert';

class Statistics {
  final int sumAPositive;
  final int sumANegative;
  final int sumBPositive;
  final int sumBNegative;
  final int sumOPositive;
  final int sumONegative;
  final int sumABPositive;
  final int sumABNegative;
  Statistics({
    this.sumAPositive,
    this.sumANegative,
    this.sumBPositive,
    this.sumBNegative,
    this.sumOPositive,
    this.sumONegative,
    this.sumABPositive,
    this.sumABNegative,
  });

  Map<String, dynamic> toMap() {
    return {
      'sumAPositive': sumAPositive,
      'sumANegative': sumANegative,
      'sumBPositive': sumBPositive,
      'sumBNegative': sumBNegative,
      'sumOPositive': sumOPositive,
      'sumONegative': sumONegative,
      'sumABPositive': sumABPositive,
      'sumABNegative': sumABNegative,
    };
  }

  factory Statistics.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Statistics(
      sumAPositive: int.parse(map['sumAPositive'].toString()),
      sumANegative: int.parse(map['sumANegative'].toString()),
      sumBPositive: int.parse(map['sumBPositive'].toString()),
      sumBNegative: int.parse(map['sumBNegative'].toString()),
      sumOPositive: int.parse(map['sumOPositive'].toString()),
      sumONegative: int.parse(map['sumONegative'].toString()),
      sumABPositive: int.parse(map['sumABPositive'].toString()),
      sumABNegative: int.parse(map['sumABNegative'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Statistics.fromJson(String source) =>
      Statistics.fromMap(json.decode(source));
}
