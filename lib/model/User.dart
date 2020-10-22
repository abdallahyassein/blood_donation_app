import 'dart:convert';

class User {
  final int id;
  final int phoneNumber;
  final String name;
  final String email;
  final String bloodType;
  final int amount;
  final String type;
  User({
    this.id,
    this.phoneNumber,
    this.name,
    this.email,
    this.bloodType,
    this.amount,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'email': phoneNumber,
      'blood_type': bloodType,
      'amount': amount,
      'type': type,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['id'],
      phoneNumber: map['phoneNumber'],
      name: map['name'],
      email: map['email'],
      bloodType: map['blood_type'],
      amount: map['amount'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
