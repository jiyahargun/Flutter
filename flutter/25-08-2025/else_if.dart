import 'dart:io';

void main()
{
  print ( "Enter a marks :");
  var marks = int.parse(stdin.readLineSync().toString());

  if ( marks >=70 )
    {
      print (" your grade is A ");
    }
  else if ( marks >=60 )
    {
      print ( " Your grade is B ");
    }
  else if ( marks >=50 )
    {
      print (" Your garde is c ");
    }
  else if ( marks >=40 )
    {
      print (" Your grade is D ");
    }
  else
    {
      print (" you are fail ");
    }
}