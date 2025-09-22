class BankAccount
{
  var accountNumber = "";
  var accountHolder = "";
  double balance = 0;

  void deposit(double amount)
  {
    balance += amount;
    print("$amount deposited successfully.");
  }

  void withdraw(double amount)
  {
    if (amount <= balance)
    {
      balance -= amount;
      print("withdrawn successfully : $amount");

    }
    else
    {
      print("withdrwn uncuessfully: $amount");

    }
  }

  void checkBalance()
  {
    print("Account Balance: ₹$balance");
  }
}

void main()
{
  BankAccount acc = BankAccount();
  acc.accountNumber = "101";
  acc.accountHolder = "Jiya";
  acc.balance = 5000;

  acc.checkBalance();
  acc.deposit(2000);
  acc.checkBalance();
  acc.withdraw(3000);
  acc.checkBalance();
  acc.withdraw(6000);
}
