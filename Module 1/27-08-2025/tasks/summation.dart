import 'dart:io';

void main()
{
  print("Enter a number: ");
  int num = int.parse(stdin.readLineSync().toString());

  int sum = 0;

  while (num > 0)
  {
    int rem = num % 10;
    sum = sum + rem;
    num = num ~/ 10;
  }

  print("Summation of digits is: $sum");
}