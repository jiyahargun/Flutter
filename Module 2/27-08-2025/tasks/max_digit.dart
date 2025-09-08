import 'dart:io';
void main()
{
  print("Enter any number");
  var num = int.parse(stdin.readLineSync().toString());

  int maxdigit = 0;

  while (num>0)
    {
      int rem = num % 10;
      if (rem > maxdigit)
        {
          maxdigit = rem ;
        }
      num = num ~/10;
    }
  print("Maximum digit is: $maxdigit");
}