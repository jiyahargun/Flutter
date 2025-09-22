import 'dart:io';

void main ()

{
  print (" Enter a your marks :");
  var mark = int.parse(stdin.readLineSync().toString());

  if ( mark >=90 && mark <=100 )
  {
    print (" your garde is A ");
  }
  else if (mark >= 80 && mark <= 89 )
  {
    print (" your grade is B ");
  }
  else if (mark >= 70 && mark <= 79 )
  {
    print (" your garde is c ");
  }
  else if (mark >= 60 && mark <= 69 )
  {
    print (" your garde is D ");
  }
  else if  (mark >= 50 && mark <= 59 )
  {
    print (" your garde is F ");
  }
  else
  {
    print (" you are fail");
  }
}