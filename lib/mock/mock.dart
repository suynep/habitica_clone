import "package:lorem_ipsum/lorem_ipsum.dart";

List<Map<String, dynamic>> getMockTodos(int num) {
  List<Map<String, dynamic>> m = [];

  for (int i = 0; i < num; i++) {
    m.add({
      "title": loremIpsum(words: 5),
      "description": loremIpsum(paragraphs: 1),
    });
  }

  return m;
}
