import 'dart:io';

void main ()
{
  print("Enter Your Name:");
  var name = stdin.readLineSync().toString();

  print("Enter Your Age:");
  var age = int.parse(stdin.readLineSync().toString());

  int yearsleft = 100 - age ;

  print("Welcome, $name");
  print("you have $yearsleft years left until you turn 100");
}