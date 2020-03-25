import 'package:hive/hive.dart';

Future<void> tagAdd(String name) async {
  await Hive.openBox('settings');
  final tagsBox = Hive.box("settings");
  if (tagsBox.isEmpty) {
    await tagsBox.put("selected", []);
  }
  List<dynamic> selected = tagsBox.get("selected");
  // print(selected);
  selected.add(name);
  await tagsBox.put("selected", selected);
}

Future<void> tagRemove(String name) async {
  await Hive.openBox('settings');
  final tagsBox = Hive.box("settings");
  if (tagsBox.isEmpty) {
    await tagsBox.put("selected", []);
  }
  List<dynamic> selected = tagsBox.get("selected");
  // print(selected);

  selected.remove(name);
  await tagsBox.put("selected", selected);
}
