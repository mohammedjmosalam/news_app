import 'package:hive/hive.dart';

class HiveStorg {
  Box? boxSavedNews;
  Future<void> initDataBase() async {
    boxSavedNews = await Hive.openBox('SavedNews');
  }

  bool isKeyExist(String key) {
    return boxSavedNews!.keys.contains(key);
  }

  Future<void> addOrRemoveNewsFromBox(
    Map<String, dynamic> newsJson,
    String key,
  ) async {
    if (isKeyExist(key)) {
      await boxSavedNews!.delete(key);
    } else {
      await boxSavedNews!.put(key, newsJson);
    }
  }

  Map? getFromBox(String key) {
    var data = boxSavedNews!.get(
      key,
    );
    print(data);

    return Map.from(data);
  }

  List<Map> getAllSavedNews() {
    List<String> keysInDataBase = List.from(boxSavedNews!.keys);
    List<Map> listJsonNews = [];
    for (var key in keysInDataBase) {
      if (getFromBox(key) != null) {
        listJsonNews.add(getFromBox(key)!);
      }
    }
    return listJsonNews;
  }
}
