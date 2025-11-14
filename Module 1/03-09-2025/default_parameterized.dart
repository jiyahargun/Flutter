findvolume(int length, {int breadth =4, int height = 20})
{
print("length is $length");
print("breadth is $breadth");
print("height $height");

print("volume is ${length * breadth* height}");
}
void main ()
{
  findvolume(10);
  print("");

  findvolume(10, breadth: 5, height: 30);
  print("");
  
  findvolume(10, height: 30, breadth: 5);
}