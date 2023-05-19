import 'dart:async';
import 'dart:convert';
import 'package:bloc_tutorial/data/api/api_client.dart';
import 'package:hive/hive.dart';

class Storage {
  late LazyBox apiBox;

  Storage._constructor() {
    apiBox = Hive.lazyBox('appBox');
  }

  static Storage instance = Storage._constructor();

  factory Storage() => instance;

  Future<dynamic> getCachedOrLoad(ApiLoader apiLoader)async{
    final c =

  }


}
