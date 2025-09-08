import 'dart:io';

void main()
{
  print("Enter Your Name:");
  var name=stdin.readLineSync().toString();

  print ("Enter Your Age:");
  var age=stdin.readLineSync().toString();

  print ("Enter Your Salary:");
  var salary = int.parse(stdin.readLineSync().toString());

  print ("Enter Your Extra income :");
  var ei = int.parse(stdin.readLineSync().toString());

  var finalamount = salary + ei;

  print(name);
  print(age);
  print(finalamount);
}