import 'dart:convert';
import 'dart:io';
import "package:path_provider/path_provider.dart";

abstract class IDatabase {
  Future<void> addTodo(String id, String title, String description, bool check);
  Future<void> checkTodo(String id);
  Future<void> uncheckTodo(String id);
  Future<void> deleteTodo(String id);
}

class JSONDatabase implements IDatabase {
  static String path = "data.json";

  Future<File> _getFile() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = "${directory.path}/data.json";
    print(path);
    return File(path);
  }

  @override
  Future<void> addTodo(
    String id,
    String title,
    String description,
    bool check,
  ) async {

    final f = await _getFile();
    var stringRawData = "[]";

    if (f.existsSync()) {
      var rf = f.openSync(mode: FileMode.read);
      rf.setPositionSync(0);
      var rawData = rf.readSync(1000000);
      await rf.close();
      stringRawData = utf8.decode(rawData);
    }

    var decodedJson = jsonDecode(stringRawData) as List;

    decodedJson.add({
      "id": id,
      "title": title,
      "description": description,
      "check": check,
    });

    var wf = f.openSync(mode: FileMode.write);

    wf.writeStringSync(jsonEncode(decodedJson));

    await wf.close();
  }

  @override
  Future<void> checkTodo(String id) {
    // TODO: implement checkTodo
    throw UnimplementedError();
  }

  @override
  Future<void> uncheckTodo(String id) {
    // TODO: implement uncheckTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }
}
