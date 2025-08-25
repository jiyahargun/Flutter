import 'dart:io';

void main ()
{
  print ("Enter number");
  var num = int.parse(stdin.readLineSync().toString());

  var a = 5 ;
  a = num ;
  print(a);

}