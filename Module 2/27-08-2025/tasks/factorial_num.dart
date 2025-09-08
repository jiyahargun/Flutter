import 'dart:io';

void main()
{
  print("Enter a number: ");
  int num = int.parse(stdin.readLineSync().toString());

  int fact = 1;

  for (int i = 1; i <= num; i++)
  {
    fact = fact * i;
  }

  print("Factorial of $num is: $fact");
}