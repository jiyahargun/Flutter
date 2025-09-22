import 'dart:io';

void main()
{
  String filePath = 'bin/practical/hello.txt';
  try
  {
    File file = File(filePath);
    file.writeAsStringSync("hello ,i am jiya hargun");
    print("Data written to the file successfully.");
  }
  catch (e)
  {
    print("Error writing to file: $e");
  }
  try
  {
    File file = File(filePath);
    String contents = file.readAsStringSync();
    print("Data read from the file:");
    print(contents);
  }
  catch (e)
  {
    print("Error reading from file: $e");
  }
}
