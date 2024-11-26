import 'dart:convert';
import 'dart:io';
import '../model/saldo.dart';


void saveData(Saldo saldo) {
  final file = File('saldo.json');
  file.writeAsStringSync(jsonEncode(saldo.toJson()));
}

Saldo loadData() {
  final file = File('saldo.json');
  if (file.existsSync()) {
    final data = jsonDecode(file.readAsStringSync());
    return Saldo.fromJson(data);
  } else {
    return Saldo(0);
  }
}