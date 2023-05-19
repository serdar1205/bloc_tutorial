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

  Future<dynamic> getCachedOrLoad(ApiLoader apiLoader) async {
    final completer = Completer<dynamic>();

    ///always update the data
    apiLoader.loader().then((value) {
      final data = value.data;

      if (!completer.isCompleted) {
        completer.complete(data);
      }

      if (data is Iterable) {
        apiBox.put(apiLoader.path, jsonEncode(data.toList()));
      } else {
        apiBox.put(apiLoader.path, jsonEncode(data));
      }
    });

    ///get data from cache
    if (apiBox.containsKey(apiLoader.path)) {
      String raw = await apiBox.get(apiLoader.path);
      if (!completer.isCompleted) {
        completer.complete(jsonDecode(raw));
      }
    }

    return completer.future;
  }
}
