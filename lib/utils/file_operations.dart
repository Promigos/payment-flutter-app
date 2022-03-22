import 'dart:io';
import 'package:path_provider/path_provider.dart';

read(filepath) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/${filepath}');
    String text = await file.readAsString();
    return text;
  } catch (e) {
    return 'Not Found';
  }
}
save(filepath) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/${filepath}');
  final text = 'Hello World!';
  await file.writeAsString(text);
  print('saved');
}