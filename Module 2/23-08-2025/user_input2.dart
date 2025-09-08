import 'dart:io';

void main()
{
   var myemail = "tops@gmail.com",mypass="1234";

   print("Enter Email");
   var email =stdin.readLineSync().toString();

   print("Enter Password");
   var pass = stdin.readLineSync().toString();

   if(email == myemail &&  pass == mypass)
     {
       print("login sucesfully");
     }
   else
     {
       print("invalid credentials");
     }
}