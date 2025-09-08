import 'dart:io';

void main ()
{
  print("Enter a first number:");
  double num1 = double.parse(stdin.readLineSync().toString());

  print("Enter second number:");
  double num2 = double.parse(stdin.readLineSync().toString());

  double add = num1+num2;
  double sub = num1 - num2 ;
  double mul = num1 * num2 ;
  double div = num1 / num2 ;
  double mod = num1 % num2 ;

  print("your Addition is : $add");
  print("your subtraction is : $sub");
  print("your multiplication is : $mul");
  print("your division is : $div");
  print("your modulus is : $mod ");
}