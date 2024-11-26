import '../database/data.dart';
import '../model/saldo.dart';

int balanceCheck() {
  Saldo saldoModel = loadData();
  print("Your Balance is ${saldoModel.balance}");
  return saldoModel.balance;
}