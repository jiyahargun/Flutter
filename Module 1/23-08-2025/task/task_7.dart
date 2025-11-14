import 'dart:io';

void main ()

{

  print ("Enter marks of first subject:");
  double sub1 = double.parse(stdin.readLineSync().toString());

  print ("Enter marks of second subject:");
  double sub2 = double.parse(stdin.readLineSync().toString());

  print ("Enter marks of third subject:");
  double sub3 = double.parse(stdin.readLineSync().toString());

  print ("Enter marks of fourth subject:");
  double sub4 = double.parse(stdin.readLineSync().toString());

  print ("Enter marks of fifth subject:");
  double sub5 = double.parse(stdin.readLineSync().toString());

  print ("Enter marks of six subject:");
  double sub6 = double.parse(stdin.readLineSync().toString());

  print ("Enter marks of seventh subject:");
  double sub7 = double.parse(stdin.readLineSync().toString());

  double total =  sub1 + sub2 + sub3 + sub4 + sub5 + sub6 + sub7;

  double percentage = (total/7);

  print("total marks: $total");
  print("percentage: $percentage");
}
