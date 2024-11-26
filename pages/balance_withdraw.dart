import 'dart:io';

import '../database/data.dart';
import '../model/saldo.dart';

balanceWithdraw(){
  Saldo saldoModel = loadData();
  stdout.write("Input Withdraw: Rp ");
  int? withdraw = int.tryParse(stdin.readLineSync()!); 

  if (withdraw! > 5000) {
    saldoModel.balance -= withdraw;
    print("Success! Your balance is now Rp ${saldoModel.balance}");
    return saveData(saldoModel);
  }else {
    print("Failed! Withdraw must above Rp 5000!");
  }

}