import 'dart:io';

void main()
{
  print("Enter total numbers:");
  int n = int.parse(stdin.readLineSync().toString());

  List<int> numbers = [];

  for (int i = 0; i < n; i++)
  {
    print("Enter number ${i + 1}:");
    int value = int.parse(stdin.readLineSync().toString());
    numbers.add(value);
  }

  for (int i = 0; i < n; i++)
  {
    for (int j = i + 1; j < n; j++)
    {
      if (numbers[i] > numbers[j])
      {
        int temp = numbers[i];
        numbers[i] = numbers[j];
        numbers[j] = temp;
      }
    }
  }
  print("Ascending order: $numbers");


  for (int i = 0; i < n; i++)
  {
    for (int j = i + 1; j < n; j++)
    {
      if (numbers[i] < numbers[j])
      {
        int temp = numbers[i];
        numbers[i] = numbers[j];
        numbers[j] = temp;
      }
    }
  }
  print("Descending order: $numbers");
}
