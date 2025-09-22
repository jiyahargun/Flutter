import 'dart:io';

void main()
{
  print (" Enter any number ");
  var num = int.parse(stdin.readLineSync().toString());

  bool prime = true;

  if ( num <=1 )
  {
    prime = false;
  }
  else
  {
    int i = 2 ;
    while ( i< num )
    {
      if ( num % i == 0)
      {
        prime = false ;
        break ;
      }
      i ++ ;
    }
  }
  if ( prime)
  {
    print ( "$num is a prime number ");
  }
  else
  {
    print("$num is not a prime number");
  }
}