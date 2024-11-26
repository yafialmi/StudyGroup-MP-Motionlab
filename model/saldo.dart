  class Saldo {
    int balance;
    Saldo(this.balance);

    Map<String, dynamic> toJson() => {'balance': balance};
    static Saldo fromJson(Map<String, dynamic> json) => Saldo(json['balance']);
  }