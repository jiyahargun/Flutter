import 'dart:io';

int factorial (int n)
{
  int fact = 1;
  for ( int i =1;  i<=n; i++)
  {
    fact = fact * i;
  }
  return fact;
}
void main ()
{
  print("Enter a Number :");
  var num = int.parse(stdin.readLineSync().toString());

  var result = factorial (num);
  print("factorial of $num is $result");
}