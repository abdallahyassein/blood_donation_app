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
      sumAPositive: int.parse(map['sumAPositive']),
      sumANegative: int.parse(map['sumANegative']),
      sumBPositive: int.parse(map['sumBPositive']),
      sumBNegative: int.parse(map['sumBNegative']),
      sumOPositive: int.parse(map['sumOPositive']),
      sumONegative: int.parse(map['sumONegative']),
      sumABPositive: int.parse(map['sumABPositive']),
      sumABNegative: int.parse(map['sumABNegative']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Statistics.fromJson(String source) =>
      Statistics.fromMap(json.decode(source));
}
