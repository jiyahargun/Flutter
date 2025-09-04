abstract class A
{
  a();

}
abstract class B extends A
{
  b();

}

abstract class C extends A
{
  c();

}

class D implements B,C
{
  d()
  {
  print("D called");
  }

  @override
  a()
  {
   print("A called");
  }

  @override
  b()
  {
    print("B called");
  }

  @override
  c()
  {
    print("C called");
  }
}
void main ()
{
  var d1 = D();

  d1.a();
  d1.b();
  d1.c();
  d1.d();
}