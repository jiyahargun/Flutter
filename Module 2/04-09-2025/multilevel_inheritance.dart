class A
{
  a()
  {
    print("A called");
  }
}

class B extends A
{
   b()
   {
     print("B called");

   }
}

class C extends B
{
  c()
  {
    print("c called");
  }
}

void main ()
{
  var c1 = C();

  c1.a();
  c1.b();
  c1.c();
}