import 'dart:io';

class Book {
  var title = "";
  var author = "";
  int publishyear = 0;

  bookdetails()
  {
    print("Your book title is : $title");
    print("The book author is : $author");
    print("Book publish year is : $publishyear");
  }

  bookcheck()
  {
    int currentyear = DateTime.now().year;
    if (currentyear - publishyear > 10)
    {
      print("This book is over 10 years old");
    }
    else
    {
      print("This book is not over 10 years old");
    }
  }
}

void main()
{
  var b = Book();

  print("Enter book name");
  b.title = stdin.readLineSync().toString();

  print("Enter author name");
  b.author = stdin.readLineSync().toString();

  print("Enter publish year of book");
  b.publishyear = int.parse(stdin.readLineSync().toString());

  b.bookdetails();
  b.bookcheck();
}
