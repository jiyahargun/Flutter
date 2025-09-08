import 'dart:io';

void main()

{
  print ("Enter a number :");
  var num = int.parse(stdin.readLineSync().toString());

  int square = num * num ;
  int cube = num * num * num ;

  print ("the square is : $square");
  print ("the cube is : $cube");
}