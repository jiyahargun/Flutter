import 'dart:io';

void main()
{
  print("Enter any number");
  var num = int.parse(stdin.readLineSync().toString());

  int rev = 0;

  while(num>0)
    {
      int rem = num % 10;
      rev = ( rev *10 )+rem;
      num = num ~/ 10;
    }
  print("Reverse number is: $rev");
}