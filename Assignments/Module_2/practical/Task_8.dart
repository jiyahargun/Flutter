import 'dart:io';

void main()

{

  print(" Enter Your Choice ");
  print("1. Addition (+)");
  print("2. Subtraction (-)");
  print("3. Multiplication (*)");
  print("4. Division (/)");

  var choice = int.parse(stdin.readLineSync().toString());
  var result;

  print("Enter first number: ");
  var num1 = double.parse(stdin.readLineSync().toString());

  print("Enter second number: ");
  var num2 = double.parse(stdin.readLineSync().toString());



  if (choice == 1)
  {
    result = num1 + num2;
    print("Result = $result");
  }
  else if (choice == 2)
  {
    result = num1 - num2;
    print("Result = $result");
  }
  else if (choice == 3)
  {
    result = num1 * num2;
    print("Result = $result");
  }
  else if (choice == 4)
  {
    result = num1 / num2;
    print("Result = $result");
  }

  else
  {
    print("Invalid choice! Please choose between 1 and 4.");
  }
}
