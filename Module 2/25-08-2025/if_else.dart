import 'dart:io';

void main()
{
  print("Enter marks:");
  var marks = int.parse(stdin.readLineSync().toString());

  if ( marks > 35)
    {
      print("you are pass");
    }
  else
    {
      print("you are fail");
    }
}