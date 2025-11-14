import 'dart:io';

void main()
{
  print("Enter Any number");
  var num = int.parse(stdin.readLineSync().toString());

  int num1 = 0;
  int num2 = 1;

  print("Fibonacci series");

  for ( int i =1; i<=num; i++)
    {
      print(num1);
      int next = num1 + num2;
      num1=num2;
      num2=next;
    }
}