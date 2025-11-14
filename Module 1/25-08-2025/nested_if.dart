import 'dart:io';

void main()
{
  print("Enter Your Age :");
  var age = int.parse(stdin.readLineSync().toString());

  if (age >= 18)
  {
    print("Eligible for vote");

  if (age >= 60) {
    print(" senior citizen ");
  }
  else {
    print("you are young");
  }
}
      else
        {
          print(" not eligible for vote");
        }

}