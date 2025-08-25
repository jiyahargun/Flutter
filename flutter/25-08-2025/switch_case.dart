import 'dart:io';
import 'dart:vmservice_io';

void main()
{
  print (" Enter number:");
  var num = int.parse(stdin.readLineSync().toString());

  switch ( num )
      {
    case 1 :
      print ("your selected language is english");

    case 2:
      print (" your selected language is hindi");

    case 3 :
      print (" your selected language is gujrati");

    default :
      print (" your number is invalid ");
  }
}