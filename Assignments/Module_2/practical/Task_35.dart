import 'package:path/path.dart' as path;

void main()
{
  String filePath = r'D:\dart_sdk\bin\practical\hello.txt';

  String directory = path.dirname(filePath);
  String filename = path.basename(filePath);
  String extension = path.extension(filePath);

  print('Full path: $filePath');
  print('Directory: $directory');
  print('Filename: $filename');
  print('Extension: $extension');
}
