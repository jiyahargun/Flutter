import 'dart:io';
void main()
{
  print("Temperature Converter");
  print (" 1. celsius to Fahrenheit");
  print (" 2. fahrenheit to celsius");


  print("enter your choice 1 or 2");
  var choice = int.parse(stdin.readLineSync().toString());

  if ( choice == 1 )
  {
    print ("Enter temperature in celsius :");
    var celsius = double.parse(stdin.readLineSync().toString());
    var fahrenheit = (celsius * 9 / 5) + 32;
    print("$celsius °C = $fahrenheit °F");
  }
  else if (choice == 2)
  {
    print ("Enter temperature in Fahrenheit:");
    var  fahrenheit = double.parse(stdin.readLineSync().toString());
    var celsius = (fahrenheit - 32) * 5 / 9;
    print("$fahrenheit °F = $celsius °C");
  }
  else
  {
    print("Invalid choice! Please enter 1 or 2.");

  }
}