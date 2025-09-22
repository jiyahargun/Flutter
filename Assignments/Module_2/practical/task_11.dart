import 'dart:io';

int Fibonnaci(int n)
{
  if (n<=1)
  {
    return n;
  }
  else
  {
    return Fibonnaci(n - 1) + Fibonnaci(n - 2);
  }
}

void main()
{
  print("Enter Fibonnaci number");
  var number = int.parse(stdin.readLineSync().toString());

  print("fibonnaci is $number terms");

  for(int i =0 ; i < number; i++)
  {
    print(Fibonnaci(i));
  }
}