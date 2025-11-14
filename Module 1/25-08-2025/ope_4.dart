import 'dart:io';
void main()
{
  print("Enter number between 1 to 10:");
  var num=int.parse(stdin.readLineSync().toString());

  if(num!=10)
    {
      print("Already assigned");
    }
  else
    {
      print("available");
    }
}