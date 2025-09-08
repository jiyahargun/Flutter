import 'dart:io';
void main()
{
  print("Enter Your name:");
  var name = stdin.readLineSync().toString();

  print("Enter Your Age:");
  var age = stdin.readLineSync().toString();

  print("Enter Your Address:");
  var address = stdin.readLineSync().toString();

  print("Enter Your Birthdate:");
  var birthdate = stdin.readLineSync().toString();

  print(name);
  print(age);
  print(address);
  print(birthdate);
}
