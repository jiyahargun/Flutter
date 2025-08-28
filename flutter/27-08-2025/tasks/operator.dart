import 'dart:io';

void main()
{
  print("choose number");
  print("1. Addition");
  print("2. Subtraction");
  print("3. Multiplication");
  print("4. Division");

  var choice = int.parse(stdin.readLineSync().toString());
  print("Enter first number: ");
  var num1 = double.parse(stdin.readLineSync().toString());

  print("Enter second number: ");
  var num2 = double.parse(stdin.readLineSync().toString());

  switch (choice)
  {
    case 1:
      double result = num1 + num2;
      print("Result = $result");

    case 2:
      double result = num1 - num2;
      print("Result = $result");

    case 3:
      double result = num1 * num2;
      print("Result = $result");

    case 4:
        double result = num1 / num2;
        print("Result = $result");

    default:
      print("Invalid choice! Please select between 1 and 4.");
  }
}