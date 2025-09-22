import 'dart:io';

void main()
{
  print("Loading... Please wait.");

  Future.delayed(Duration(seconds: 3), ()
  {
    print("Operation completed successfully!");
  });
}
