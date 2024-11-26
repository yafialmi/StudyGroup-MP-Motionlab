import 'dart:io';

import '../database/data.dart';
import '../model/saldo.dart';

balanceDeposit(){
  Saldo saldoModel = loadData();
  stdout.write("Input Deposit: Rp ");
  int deposit = int.parse(stdin.readLineSync()!);

  if (deposit > 10000){
    saldoModel.balance += deposit;
    print("Success! Your balance is now ${saldoModel.balance}");
    return saveData(saldoModel);
  }else{
    print("Failed! Deposit must above Rp 10000!");
  }
}