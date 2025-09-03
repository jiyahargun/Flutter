class Student
{
     var  n;
     var  e;

     Student(var name,var email)
     {
       n = name;
       e = email;
     }
     display()
     {
       print("$n , $e");
     }
}

void main()
{
   var s1 = Student ("jiya", "jiya@gmail.com");
   var s2 = Student("jiya", "jiya@gmail.com");

   s1.display();
   s2.display();

}