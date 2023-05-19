import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'dart:convert';

@immutable
class UserModel extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  const UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company}';
  }

  @override
  List<Object> get props => [
        id,
        name,
        username,
        email,
        address,
        phone,
        website,
        company,
      ];

  @override
  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromMap(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromMap(json["company"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toMap(),
        "phone": phone,
        "website": website,
        "company": company.toMap(),
      };
}

@immutable
class Address extends Equatable {
  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromMap(json["geo"]),
      );

  Map<String, dynamic> toMap() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toMap(),
      };

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  List<Object> get props => [street, suite, city, zipcode, geo];
}

@immutable
class Geo extends Equatable {
  const Geo({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object> get props => [lat, lng];
  final String lat;
  final String lng;

  factory Geo.fromJson(String str) => Geo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geo.fromMap(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };

  @override
  String toString() {
    return toMap().toString();
  }
}

@immutable
class Company extends Equatable {
  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  @override
  List<Object> get props => [name, catchPhrase, bs];

  final String name;
  final String catchPhrase;
  final String bs;

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
