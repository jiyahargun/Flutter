import 'dart:io';
void main()
{
  print("Enter a number: ");
  var num = int.parse(stdin.readLineSync().toString());

  int lg = num % 10;

  int fg = num;
  while (fg >= 10) {
    fg = fg ~/ 10;
  }

  int sum = fg + lg;

  print("Summation of first and last digit is: $sum");
}