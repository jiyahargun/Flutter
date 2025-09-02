import 'dart:io';

class Student
{
   var email = "tops@gmail.com";
   var pass = "12345";

   var e ="";
   var p = "";

   display()
   {
     if(email==email && pass== pass)
       {
         print("login sucesfully");
       }
     else
       {
         print("login fail");
       }
   }
}




void main ()
{
  print("Enter Your Email ");
  var e = stdin.readLineSync().toString();

  print("Enter Your Password");
  var p = stdin.readLineSync().toString();

  var s1 = Student();
  s1.e=e;
  s1.p=p;

s1.display();

}