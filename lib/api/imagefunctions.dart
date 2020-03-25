import 'package:hive/hive.dart';

Future<bool> hasDownloaded(String id, bool check) async {
  await Hive.openBox('downloads');
  final downloads = Hive.box("downloads");
  var downloaded = downloads.get(id);
  if (downloaded == null) {
    if (!check) await downloads.put(id, id);
    return false;
  }
  return true;
}
