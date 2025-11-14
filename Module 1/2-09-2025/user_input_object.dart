import 'dart:io';

class Student
{
    var name;
    var email;
}


void main ()
{
   var s1 = Student();
   
   print("Enter Your Name");
   var name = stdin.readLineSync().toString();
   
   print("Enter Your Email");
   var email = stdin.readLineSync().toString();

   s1.name = name;
   s1.email = email;

   print("Your name is : ${s1.name}");
   print("Your email is : ${s1.email}");

}