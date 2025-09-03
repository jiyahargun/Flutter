class Student
{
  Student (var name, var surname, var email, var city)
  {
     print("$name");
     print("$surname");
     print("$email");
     print("$city");
  }
  Student.a(var name, var surname, var email)
  {
    print("$name");
    print("$surname");
    print("$email");
  }
}

void main()
{
   var s1 = Student("jiya", "hargun", "jiya@gmail.com", "jetpur");
   var s2 = Student.a("jiya", "hargun", "jiya@gmail,com");

}