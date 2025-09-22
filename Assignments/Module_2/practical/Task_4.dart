import 'dart:io';

void main()
{
  const double pi = 3.14;

  print("Enter the radius of the circle: ");
  var r = double.parse(stdin.readLineSync().toString());

  double area = pi * r  * r;
  double circumference = 2 * pi * r;

  print("Area of Circle: $area");
  print("Circumference of Circle: $circumference");




}