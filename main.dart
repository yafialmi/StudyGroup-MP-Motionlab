import 'dart:io';

import 'pages/balance_check.dart';
import 'pages/balance_deposit.dart';
import 'pages/balance_withdraw.dart';

void main(){
  while (true) {
    print("Welcome to Dart Bank! How can I help you?");
    stdout.write(
        " 1. Check Balance\n 2. Deposit Balance\n 3. Withdraw Balance\nInput here: ");
    String? userInput = stdin.readLineSync();

    if (userInput == "quit") {
      print("Thank you!");
      break; 
    }

    int? input = int.tryParse(userInput!);
    if (input != null) {
      checkConditionInput(input);
    } else {
      print("Invalid! Please enter a number or 'quit' to exit.");
    }
  }
}

void checkConditionInput(int input) {
  switch (input) {
    case 1:
      balanceCheck();
      break;
    case 2:
      balanceDeposit();
      break;
    case 3:
      balanceWithdraw();
      break;
    default:
      print("Please input the correct selection!");
  }
}